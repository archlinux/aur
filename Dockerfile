FROM greyltc/archlinux-aur:yay

# Install base dependencies
RUN pacman --noconfirm -Sy fakeroot binutils make

# Install OpenGamepadUI dependencies
RUN pacman --noconfirm -S \
  rust \
  gamescope \
  vulkan-tools \
  mesa-utils \
  godot \
  unzip \
  wget \
  git

RUN aur-install inputplumber-bin

RUN mkdir /home/build && chmod 777 /home/build
