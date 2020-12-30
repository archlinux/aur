FROM archlinux
RUN pacman -Sy --noconfirm sudo fakeroot base-devel
RUN pacman -S --noconfirm git
RUN pacman -S --noconfirm vim
COPY docker.sudoers /etc/sudoers.d/wheel
RUN useradd user
RUN usermod -a user -G wheel

