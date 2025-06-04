FROM greyltc/archlinux-aur:yay AS base
RUN pacman -Syy
RUN useradd -m -p '' app
RUN echo 'app ALL=(ALL) NOPASSWD: ALL' | tee -a /etc/sudoers

FROM base
USER app
WORKDIR /home/app

RUN yay -S gdbuspp --noconfirm --removemake

COPY PKGBUILD .SRCINFO openvpn3.install openvpn3.rule sysusers-openvpn3.conf google-test-1.17.patch ./
RUN makepkg -fcCris --noconfirm
