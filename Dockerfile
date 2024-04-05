FROM archlinux:base-devel

RUN pacman --noconfirm -Sy fakeroot binutils make
RUN pacman --noconfirm -Sy \
  libevdev \
  rust \
  cmake \
  clang \
  libiio \
  git

RUN mkdir -p /home/build && chmod 777 /home/build
