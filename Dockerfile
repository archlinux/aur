FROM greyltc/archlinux-aur:yay

# Install base dependencies
RUN pacman --noconfirm -Sy fakeroot binutils make

# Install OpenGamepadUI dependencies
RUN pacman --noconfirm -S \
  libx11 \
  libxres \
  libxcb \
  libxext \
  libxau \
  libxdmcp \
  gamescope \
  vulkan-tools \
  mesa-utils \
  godot \
  scons \
  pkgconf \
  gcc \
  libxinerama \
  glu \
  alsa-lib \
  unzip \
  wget \
  git

RUN aur-install inputplumber-bin

RUN mkdir /home/build && chmod 777 /home/build
