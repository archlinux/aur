# Maintainer: Andrew Kozik <andrewkoz at live dot com>

pkgname=mingw-w64-lzlib
pkgver=1.12
pkgrel=3
pkgdesc="A library providing in-memory LZMA compression and decompression functions (mingw-w64)"
arch=('any')
url="https://www.nongnu.org/lzip/lzlib.html"
license=('2-clause BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-make')
options=('!strip' 'staticlibs' '!buildflags')
source=(http://download.savannah.gnu.org/releases/lzip/lzlib/lzlib-${pkgver}.tar.gz{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha256sums=('8e5d84242eb52cf1dcc98e58bd9ba8ef1aefa501431abdd0273a22bf4ce337b1'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/lzlib-${pkgver}
  for _arch in $_architectures; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    ${_arch}-make
    popd
  done
}

package() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    cd "$srcdir"/lzlib-${pkgver}/build-${_arch}
    DESTDIR="$pkgdir" ${_arch}-make install
    install -Dm755 minilzip.exe "$pkgdir"/usr/${_arch}/bin/minilzip.exe
    install -Dm755 liblz.so.${pkgver} "$pkgdir"/usr/${_arch}/bin/liblz.dll
    rm "$pkgdir"/usr/${_arch}/lib/liblz.so*
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
