# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_pkgname=lzlib
pkgname=mingw-w64-${_pkgname}
pkgver=1.16
pkgrel=1
pkgdesc="A library providing in-memory LZMA compression and decompression functions (mingw-w64)"
arch=('any')
url="https://www.nongnu.org/lzip/lzlib.html"
license=('BSD-2-Clause')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-make')
options=('!strip' 'staticlibs' '!buildflags' '!debug')
source=("https://download.savannah.gnu.org/releases/lzip/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('203228de911780309dad6813e51541d7ea89469784f01cb661edba080ff1b038'
            'SKIP')
validpgpkeys=('1E5AEE0B18C0DEB45D64AA0325B62C9821501AA0') # Antonio Diaz Diaz <antonio@gnu.org>

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
  # info dir file would conflict/be non-FHS under the mingw prefix
  rm -rf "$pkgdir"/usr/*-w64-mingw32/share
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
