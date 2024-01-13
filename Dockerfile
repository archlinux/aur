FROM archlinux:latest

RUN pacman --noconfirm -Sy fakeroot binutils make
RUN pacman --noconfirm -S \
  libx11 \
  libxres \
  libxcb \
  libxext \
  libxau \
  libxdmcp \
  gamescope \
  vulkan-tools \
  mesa-utils
