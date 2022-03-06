# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Colm Hickey <colmohici@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=lib32-zeromq
pkgver=4.3.4
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
  cmake
  git
  ninja
  xmlto
)
_tag=7824f6762fa526c5bfb0baa23a6839ecf5988e91
source=(
  git+https://github.com/zeromq/libzmq.git?signed#tag=${_tag}
  lib32-zeromq-openpgm.patch
)
validpgpkeys=(A9EA9081724FFAE0484C35A1A81CEA22BC8C7E2E) # Luca Boccassi <luca.boccassi@gmail.com>
sha256sums=('SKIP'
            '59d3b09f15096fee4effb1916d0788243f41f6a0aa166ae53a8d876abc63fc48')

prepare() {
  cd libzmq
  patch -Np1 -i ../lib32-zeromq-openpgm.patch
}

pkgver() {
  cd libzmq
  git describe --tags | sed 's/^v//'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export CXXFLAGS+=' -Wno-unused-function'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  cmake -S libzmq -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DWITH_DOC=OFF \
    -DWITH_LIBSODIUM=ON \
    -DWITH_OPENPGM=ON \
    -DWITH_TLS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
