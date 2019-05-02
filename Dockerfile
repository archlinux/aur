FROM archlinux/base:latest

RUN pacman -Syu --noconfirm --needed base-devel

WORKDIR /src
