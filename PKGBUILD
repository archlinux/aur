# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Colm Hickey <colmohici@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=lib32-zeromq
pkgver=4.3.2
pkgrel=2
pkgdesc='Fast messaging system built on sockets'
arch=(x86_64)
url=https://www.zeromq.org
license=(LGPL)
depends=(
  lib32-gcc-libs
  lib32-glibc
  lib32-libpgm
  lib32-libsodium
  zeromq
)
makedepends=(
  asciidoc
  git
  xmlto
)
source=(git+https://github.com/zeromq/libzmq.git#tag=9ff57777c148561a173515ed82ee30954607f332)
sha256sums=(SKIP)

pkgver() {
  cd libzmq

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd libzmq

  ./autogen.sh
}

build() {
  cd libzmq

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static \
    --with-libsodium \
    --with-pgm \
    --without-documentation
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libzmq install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
