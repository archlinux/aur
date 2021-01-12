# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lib32-libnsl-git
pkgver=1.3.0
pkgrel=1
pkgdesc='Public client interface library for NIS(YP) and NIS+'
arch=(x86_64)
url=https://github.com/thkukuk/libnsl
license=(LGPL2.1)
depends=(
  lib32-libtirpc
  libnsl
)
makedepends=(git)
provides=(lib32-libnsl)
conflicts=(lib32-libnsl)
source=(git+https://github.com/thkukuk/libnsl.git)
sha256sums=(SKIP)

_commit() {
  # Convert HEAD into a shortened commit id:
  git rev-parse --short HEAD
}

pkgver() {
  cd libnsl

  # Suggestions for improvement welcome!
  printf '%s.r%s.%s'         \
  "$(_commit)"
}

prepare() {
  cd libnsl
}

build() {
  cd libnsl

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkg-config'

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libnsl install
  rm -rf "${pkgdir}"/usr/include
}

# vim: ts=2 sw=2 et:
