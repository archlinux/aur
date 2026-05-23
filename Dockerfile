FROM archlinux:latest

RUN pacman -Syu --noconfirm --needed \
    base-devel \
    git \
    curl \
    imagemagick \
    sudo \
    gtk3 \
    libcups \
    nss \
    alsa-lib \
    libxtst \
    libdrm \
    mesa \
    libxml2-legacy \
    && pacman -Scc --noconfirm

RUN useradd -m -G users builduser && \
    echo 'builduser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN git config --global user.email "maintainer@aur.archlinux.org" && \
    git config --global user.name "AUR Maintainer" && \
    cp -r /root/.gitconfig /home/builduser/.gitconfig && \
    chown builduser:users /home/builduser/.gitconfig

RUN mkdir -p /build && chown builduser:users /build

USER builduser
WORKDIR /build

CMD ["bash"]
