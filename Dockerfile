# https://hub.docker.com/_/golang
FROM archlinux/base:latest

RUN pacman -Syu --noconfirm base base-devel namcap \
  && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && useradd -ms /bin/bash aur

USER aur:wheel
WORKDIR /home/aur
COPY . .
