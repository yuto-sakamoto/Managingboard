class UsersController < ApplicationController
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to boards_index_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "メールアドレスが無効または過去に登録済みです"
      render :new
    end 
  end 
  
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end 
end
