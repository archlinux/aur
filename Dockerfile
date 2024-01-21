FROM archlinux:latest
RUN pacman -Sqy
RUN pacman -Sq --noconfirm base-devel
RUN pacman -Sq --noconfirm git meson zeromq sdl2 capstone
RUN useradd --create-home builduser
WORKDIR /home/builduser
USER builduser
COPY PKGBUILD PKGBUILD
RUN makepkg --nobuild
RUN ulimit -n 10000 && makepkg
