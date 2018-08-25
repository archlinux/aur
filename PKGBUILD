# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=mingw-w64-liblo
pkgver=0.29
pkgrel=1
pkgdesc="A lightweight OSC (Open Sound Control) implementation (mingw-w64)"
arch=('any')
url="http://liblo.sourceforge.net/"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/radarsat1/${pkgname##*-}/releases/download/${pkgver}/${pkgname##*-}-${pkgver}.tar.gz")
sha512sums=('11e20725a049c55c02ef8cd106be5802507f3df95422d8dad10009bdd1237af7517e3261c7336c3005e21ae8fd1e663badef46e4bae006c7af70520bdb336c7c')

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
