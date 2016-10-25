class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :must_be_clickbait

  def must_be_clickbait
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"].any? do |phrase|
      title.include?(phrase) if !title.nil?
    end

    unless clickbait
      errors.add(:title, "is not clickbait")
    end
  end

end
