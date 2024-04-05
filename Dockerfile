FROM archlinux:base-devel

RUN pacman --noconfirm -Sy fakeroot binutils make
RUN pacman --noconfirm -Sy libevdev libiio
