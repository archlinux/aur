# Maintainer: Gijs Vermeulen <gijsvrm at gmail dot com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu
# Contributor: Elis Hughes <elishughes@googlemail.com>

pkgname=lib32-rtmpdump
pkgver=2.6
pkgrel=2
epoch=1
pkgdesc='A toolkit for RTMP streams (32 bit)'
arch=(x86_64)
url=https://rtmpdump.mplayerhq.hu/
license=(
  GPL-2.0-only
  LGPL-2.1-only
)
depends=(
  lib32-glibc
  lib32-gnutls
  lib32-zlib
  rtmpdump
)
makedepends=(git)
provides=(librtmp.so)
_repo=https://git.ffmpeg.org/rtmpdump
_commit=138fdb258d9fc26f1843fd1b891180416c9dc575
source=(nettle-4.patch)
sha256sums=('b9cbbcf14d9fb46962d541544f47226909a7bc7191e2be50cfd0c73c73c4b80d')

# git.ffmpeg.org has dangling refs that break a mirror clone, so shallow-clone the tag instead.
prepare() {
  if [[ ! -d rtmpdump ]]; then
    git clone --depth=1 --branch "v${pkgver}" "$_repo" rtmpdump
  fi

  cd rtmpdump
  local rev=$(git rev-parse HEAD)
  if [[ "$rev" != "$_commit" ]]; then
    echo "rtmpdump checkout ($rev) does not match pinned commit ($_commit)" >&2
    exit 1
  fi

  patch -p1 -i ../nettle-4.patch
  sed -i 's|^CC=$(CROSS_COMPILE)gcc$|CC=$(CROSS_COMPILE)gcc -m32|' Makefile librtmp/Makefile
}

build() {
  cd rtmpdump
  sed -e 's/^CRYPTO=OPENSSL/#CRYPTO=OPENSSL/' -e 's/#CRYPTO=GNUTLS/CRYPTO=GNUTLS/' -i Makefile -i librtmp/Makefile
  make \
    OPT="$CFLAGS" \
    XLDFLAGS="$LDFLAGS"
}

package() {
  cd rtmpdump
  make \
    prefix=/usr \
    sbindir=/usr/bin \
    mandir=/usr/share/man \
    libdir=/usr/lib32 \
    DESTDIR="${pkgdir}" \
    install

  rm -rf "${pkgdir}/usr"/{bin,include,share}
}

# vim: ts=2 sw=2 et:
