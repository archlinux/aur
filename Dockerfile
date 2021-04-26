FROM archlinux

# https://serverfault.com/a/1053273
# TEMP-FIX for pacman issue
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst \
    && curl -LO "https://raw.githubusercontent.com/sickcodes/Docker-OSX/master/${patched_glibc}" \
    && bsdtar -C / -xvf "${patched_glibc}" || echo "Everything is fine."
# TEMP-FIX for pacman issue

RUN pacman -Sy --noconfirm sudo fakeroot base-devel
RUN pacman -S --noconfirm git
RUN pacman -S --noconfirm vim
COPY docker.sudoers /etc/sudoers.d/wheel
RUN useradd user
RUN usermod -a user -G wheel

