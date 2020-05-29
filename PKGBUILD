# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lib32-libnsl
pkgver=1.2.0
pkgrel=2
pkgdesc='Public client interface library for NIS(YP) and NIS+'
arch=(x86_64)
url=https://github.com/thkukuk/libnsl
license=(LGPL2.1)
depends=(
  lib32-libtirpc
  libnsl
)
makedepends=(git)
source=(git+https://github.com/thkukuk/libnsl.git#tag=113d92f29bcb778fcaa9c2a18e48bce53729ea54)
sha256sums=(SKIP)

pkgver() {
  cd libnsl

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd libnsl

  git cherry-pick -n a40f7c511765e2e0c4d710d45b7d8363c18c70f8
  sed 's/0.19/0.20/g' -i po/Makefile.in.in

  ./autogen.sh
}

build() {
  cd libnsl

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkg-config'

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
