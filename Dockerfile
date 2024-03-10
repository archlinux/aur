FROM archlinux:base-devel

RUN pacman --noconfirm -Sy fakeroot binutils make
RUN pacman --noconfirm -S \
  libevdev \
  rust \
  cmake \
  clang \
  git

RUN mkdir -p /home/build && chmod 777 /home/build
