# docker build . -t archlinux-base-dev

FROM archlinux:latest

RUN useradd bb && \
    passwd -d bb && \
    mkdir /home/bb && \
    chown -R bb:bb /home/bb && \
    echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    usermod -a -G wheel bb && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo base-devel
