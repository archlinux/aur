FROM archlinux
RUN pacman -Sy --noconfirm sudo fakeroot base-devel
RUN pacman -S --noconfirm git
RUN useradd user
