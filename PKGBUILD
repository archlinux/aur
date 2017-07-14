# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-libepoxy
pkgver=1.4.3
pkgrel=1
pkgdesc="A library for handling OpenGL function pointer management for you (mingw-w64)"
arch=(any)
url="https://github.com/anholt/libepoxy"
license=('MIT')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-configure'
  'python'
  'xorg-util-macros')
depends=(
  'mingw-w64-crt')
options=(!strip !buildflags staticlibs)
source=("https://github.com/anholt/libepoxy/releases/download/${pkgver}/libepoxy-${pkgver}.tar.xz")
sha256sums=('0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libepoxy-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/libepoxy-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtL1 ${_arch}-strip
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtL1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtL1 ${_arch}-strip -g
    cd ..
  done
}
