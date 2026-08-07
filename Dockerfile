# Builds the `plug` AUR package in a clean Arch Linux environment.
#
# Usage:
#   docker build -t plug-builder .
#   mkdir -p dist && docker run --rm -v "$PWD/dist:/output" plug-builder
#
# The built package (plug-<pkgver>-<pkgrel>-x86_64.pkg.tar.zst) is copied
# into ./dist on the host. The container runs as non-root UID 1000 (see
# `builder` below), so ./dist must exist and be writable by that UID before
# running — otherwise Docker auto-creates it owned by root and the copy in
# CMD fails with "Permission denied". Creating it as your own user (as
# above) works as long as your host UID is 1000, which is the default for
# the first non-system user on most distros; otherwise pass
# `--user "$(id -u):$(id -g)"` to docker run instead.

FROM archlinux:base-devel

RUN pacman -Syu --noconfirm --needed \
        qt6-base \
        libusb \
        cmake \
        gtest \
    && pacman -Scc --noconfirm

# makepkg refuses to run as root, so build as an unprivileged user.
RUN useradd -m builder \
    && echo 'builder ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/builder

USER builder
WORKDIR /home/builder/plug

COPY --chown=builder:builder PKGBUILD .SRCINFO ./

RUN makepkg -s --noconfirm

VOLUME ["/output"]
CMD ["sh", "-c", "cp /home/builder/plug/*.pkg.tar.zst /output/"]
