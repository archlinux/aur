FROM archlinux

RUN pacman -Syu --noconfirm --needed base-devel

RUN groupadd --gid 1000 aur \
  && useradd --uid 1000 --gid aur --create-home aur \
  && usermod -aG wheel aur \
  && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && visudo -c

WORKDIR /home/aur
