FROM archlinux:base-devel

ARG USER=build
ARG UID=1000
ARG GID=1000

RUN useradd -m ${USER} --uid=${UID} -G wheel

RUN pacman-key --init
RUN pacman -Syu --noconfirm
RUN pacman -S namcap --noconfirm
RUN echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/build
RUN mkdir /build

WORKDIR /build
USER ${UID}:${GID}

CMD [ "/usr/sbin/makepkg", "-s", "--noconfirm"]
