# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=lib32-librtmp0
pkgver=2.4
pkgrel=5
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
_commit=c28f1bab7822de97353849e7787b59e50bbb1428
source=(git+https://git.ffmpeg.org/rtmpdump#commit=${_commit})
b2sums=(SKIP)

prepare() {
  cd rtmpdump
  git cherry-pick -n eea470fa5f9a5481a36dedd257549595ef7480d6
  git cherry-pick -n 8e3064207fa7535baad07fd06b65630ec8b31a08
  git cherry-pick -n 7340f6dbc6b3c8e552baab2e5a891c2de75cddcc
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
