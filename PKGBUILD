# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Colm Hickey <colmohici@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=lib32-zeromq
pkgver=4.3.3
_cppver=4.6.0
pkgrel=1
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
source=("https://github.com/zeromq/libzmq/releases/download/v$pkgver/zeromq-$pkgver.tar.gz"
        "zmq.hpp.$_cppver.tgz::https://github.com/zeromq/cppzmq/archive/v$_cppver.tar.gz")
sha256sums=('9d9285db37ae942ed0780c016da87060497877af45094ff9e1a1ca736e3875a2'
            'e9203391a0b913576153a2ad22a2dc1479b1ec325beb6c46a3237c669aef5a52')

prepare() {
  cd zeromq-$pkgver
  # Needed for new libsodium
  sed -i 's/libzmq_werror="yes"/libzmq_werror="no"/' configure

  sed -i 's/openpgm-5.1/openpgm-5.3/' configure configure.ac
  sed -i 's/CXXFLAGS="-Wno-long-long/CXXFLAGS="-Wno-unused-function -Wno-long-long/' configure
}

build() {
  cd zeromq-$pkgver

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
  make -Wno-unused-function -Wnoerror=unused-function
}

package() {
  make DESTDIR="${pkgdir}" -C zeromq-$pkgver install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
