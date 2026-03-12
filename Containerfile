FROM archlinux:base-devel

RUN pacman -Sy --noconfirm && \
    useradd -m builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers