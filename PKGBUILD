# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod
pkgver=3.3.11.1
pkgrel=3
pkgdesc='A portable sound library'
license=(
  GPL
  LGPL
)
url=http://mikmod.sourceforge.net
arch=(x86_64)
depends=(
  lib32-libpulse
  libmikmod
)
makedepends=(
  lib32-alsa-lib
  libtool-multilib
)
source=(https://downloads.sourceforge.net/mikmod/libmikmod-${pkgver}.tar.gz)
sha256sums=(ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19)

build() {
  cd libmikmod-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd libmikmod-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{include,share,bin}
}

# vim: ts=2 sw=2 et:
