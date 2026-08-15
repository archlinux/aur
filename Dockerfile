# Clean-room build/test of this AUR package.
#
#   docker build -t chemcanvas-bin-test .
#   docker run --rm -v "$PWD/dist:/out" chemcanvas-bin-test
#
# The built .pkg.tar.zst lands in ./dist on the host.
FROM archlinux:base-devel

RUN pacman -Syu --noconfirm --needed base-devel git \
    && useradd -m builder \
    && echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder \
    && mkdir -p /out && chown builder:builder /out

USER builder
WORKDIR /home/builder/pkg

COPY --chown=builder:builder PKGBUILD .SRCINFO ./

ENTRYPOINT ["/bin/sh", "-c", "makepkg -s --noconfirm && cp *.pkg.tar.zst /out/"]
