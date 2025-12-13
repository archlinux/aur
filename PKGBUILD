# Maintainer: Voxan <voxan@hessfr.fr>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=lib32-librtmp0
pkgver=2.6
pkgrel=1
pkgdesc='Toolkit for RTMP streams'
arch=(x86_64)
url=https://rtmpdump.mplayerhq.hu/
license=(
  GPL2
  LGPL2.1
)
depends=(
  lib32-glibc
  lib32-gnutls
  lib32-zlib
)
makedepends=(git)
provides=(librtmp.so)
options=(!makeflags)
_commit=6f6bb1353fc84f4cc37138baa99f586750028a01
source=(git+https://git.ffmpeg.org/rtmpdump#commit=${_commit})
b2sums=(SKIP)

prepare() {
  cd rtmpdump
  sed -e 's/^CRYPTO=OPENSSL/#CRYPTO=OPENSSL/' -e 's/#CRYPTO=GNUTLS/CRYPTO=GNUTLS/' -i Makefile -i librtmp/Makefile
}

build() {
  cd rtmpdump
  make \
    OPT="$CFLAGS -m32" \
    XLDFLAGS="$LDFLAGS -m32"
}

package() {
  cd rtmpdump
  make \
    prefix=/usr \
    sbindir=/usr/bin \
    libdir=/usr/lib32 \
    mandir=/usr/share/man \
    DESTDIR="${pkgdir}" \
    install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{librtmp.{a,so},pkgconfig},share}
}

# vim: ts=2 sw=2 et:
