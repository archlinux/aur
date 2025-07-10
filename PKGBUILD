# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_pkgname=lzlib
pkgname=mingw-w64-${_pkgname}
pkgver=1.15
pkgrel=1
pkgdesc="A library providing in-memory LZMA compression and decompression functions (mingw-w64)"
arch=('any')
url="https://www.nongnu.org/lzip/lzlib.html"
license=('BSD-2-Clause')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-make')
options=('!strip' 'staticlibs' '!buildflags')
source=(http://download.savannah.gnu.org/releases/lzip/${_pkgname}/${_pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('4afab907a46d5a7d14e927a1080c3f4d7e3ca5a0f9aea81747d8fed0292377ff'
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
    ${_arch}-make lib bin
    popd
  done
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    ${_arch}-make DESTDIR="$pkgdir" install
    install -Dm755 minilzip.exe "$pkgdir"/usr/${_arch}/bin/minilzip.exe
    install -Dm755 liblz.so.1 "$pkgdir"/usr/${_arch}/bin/liblz.dll
    rm "$pkgdir"/usr/${_arch}/lib/liblz.so*
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    popd
  done
}
