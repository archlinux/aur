FROM archlinux:base-devel

RUN pacman --noconfirm -Sy fakeroot binutils make git

RUN mkdir -p /home/build && chmod 777 /home/build
