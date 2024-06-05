FROM greyltc/archlinux-aur:yay

# Install base dependencies
RUN pacman --noconfirm -Sy --needed fakeroot binutils make

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
  mesa-utils

#RUN aur-install inputplumber-bin
