# This is used only to test that this package builds on a fresh install of Arch Linux

FROM archlinux:20200106

RUN set -xe; \
    pacman -Syu --noconfirm; \
    pacman -S --noconfirm sudo base-devel git

RUN useradd -m user
RUN echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER user

RUN set -xe; \
    cd $(mktemp -d); \
    git clone https://aur.archlinux.org/papeaks-git.git; \
    cd papeaks-git; \
    makepkg -si --noconfirm

RUN mkdir /tmp/pkg
WORKDIR /tmp/pkg
COPY ./ ./

RUN makepkg -si --noconfirm
