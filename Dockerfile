FROM archlinux

RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -S base-devel git jq wget
RUN groupadd sudo
RUN echo '%sudo	ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/docker
