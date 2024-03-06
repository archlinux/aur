FROM archlinux:base
# ref. https://github.com/KSXGitHub/github-actions-deploy-aur

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed \
      pacman-contrib

