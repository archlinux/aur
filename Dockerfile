FROM archlinux

# Install dependencies
RUN pacman -Sy binutils fakeroot git sudo nano python python-setuptools \
    python-typing_extensions --noconfirm --needed

# Copy pkgbuild file
WORKDIR /build
COPY PKGBUILD .

# Makepkg and install
RUN chmod 777 /build && \
    sleep 1 && \
    sudo -u nobody makepkg PKGBUILD && \
    pacman -U *.pkg.tar.zst && \
    pacman -Qlp *.pkg.tar.zst

# Test run
RUN hyfetch