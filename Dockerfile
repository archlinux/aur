FROM archlinux/base:latest

RUN pacman -Syu --noconfirm --needed base-devel pacman-contrib

WORKDIR /src
