# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-libepoxy
pkgver=1.3.1
pkgrel=1
pkgdesc="A library for handling OpenGL function pointer management for you (mingw-w64)"
arch=(any)
url="https://github.com/anholt/libepoxy"
license=('MIT')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-configure'
  'xorg-util-macros' 
  'python')
depends=(
  'mingw-w64-crt')
options=(!strip !buildflags staticlibs)
source=("https://github.com/anholt/libepoxy/releases/download/v${pkgver}/libepoxy-${pkgver}.tar.bz2")
sha256sums=('1d8668b0a259c709899e1c4bab62d756d9002d546ce4f59c9665e2fc5f001a64')

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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
    cd ..
  done
}
