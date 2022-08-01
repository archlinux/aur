FROM archlinux:base
MAINTAINER Sven Fischer <docker-guayadeque@linux4tw.de>

RUN yes | pacman -Syq --noprogressbar --noconfirm base-devel git sudo
RUN useradd -m -G wheel -s /bin/bash guayay && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN su -c 'git clone https://aur.archlinux.org/guayadeque-git.git $HOME/guayadeque-git && cd $HOME/guayadeque-git && makepkg --clean --nocolor --noconfirm --syncdeps' guayay

