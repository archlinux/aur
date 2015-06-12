# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=mingw-w64-liblo
pkgver=0.28
pkgrel=3
pkgdesc="A lightweight OSC (Open Sound Control) implementation (mingw-w64)"
arch=('any')
url="http://liblo.sourceforge.net/"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/${pkgname##*-}/${pkgname##*-}/$pkgver/${pkgname##*-}-$pkgver.tar.gz")
md5sums=('e2a4391a08b49bb316c03e2034e06fa2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  export CFLAGS="-Wno-error"
  cd "${srcdir}/${pkgname##*-}-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname##*-}-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}
