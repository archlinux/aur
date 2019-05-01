FROM archlinux/base:latest

RUN pacman -Sy --noconfirm --needed base-devel

RUN mkdir /src

WORKDIR /src
