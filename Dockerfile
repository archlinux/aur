FROM base/archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S nuitka --noconfirm

WORKDIR /src
