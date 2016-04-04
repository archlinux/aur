FROM pritunl/archlinux:latest
RUN pacman -S --noconfirm --needed base-devel pkgbuild-introspection

RUN mkdir /src
WORKDIR /src
