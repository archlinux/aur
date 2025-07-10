# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_pkgname=lzlib
pkgname=mingw-w64-${_pkgname}
pkgver=1.14
pkgrel=2
pkgdesc="A library providing in-memory LZMA compression and decompression functions (mingw-w64)"
arch=('any')
url="https://www.nongnu.org/lzip/lzlib.html"
license=('BSD-2-Clause')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-make')
options=('!strip' 'staticlibs' '!buildflags')
source=(http://download.savannah.gnu.org/releases/lzip/${_pkgname}/${_pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('5acac8714ed4f306020bae660dddce706e5f8a795863679037da9fe6bf4dcf6f'
            'SKIP')
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    pushd build-${_arch}
    ${_arch}-configure \
      --enable-shared
    ${_arch}-make
    popd
  done
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    ${_arch}-make DESTDIR="$pkgdir" install
    install -Dm755 minilzip.exe "$pkgdir"/usr/${_arch}/bin/minilzip.exe
    install -Dm755 liblz.so.${pkgver} "$pkgdir"/usr/${_arch}/bin/liblz.dll
    rm "$pkgdir"/usr/${_arch}/lib/liblz.so*
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    popd
  done
}
