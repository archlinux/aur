# Maintainer: Freddie Chopin <freddie_chopin at op dot pl>

pkgname=mingw-w64-libftdi
pkgver=1.2
pkgrel=2
license=('GPL2' 'LGPL2.1')
arch=('any')
pkgdesc='Library to talk to FTDI chips (mingw-w64)'
url='http://www.intra2net.com/en/developer/libftdi/'
depends=('mingw-w64-libusb')
optdepends=('mingw-w64-boost: C++ variant of libftdi (libftdipp) and unit tests')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.intra2net.com/en/developer/libftdi/download/libftdi1-$pkgver.tar.bz2")
sha256sums=('a6ea795c829219015eb372b03008351cee3fb39f684bff3bf8a4620b558488d6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/libftdi1-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    cp /usr/${_arch}/bin/*.dll .
    ${_arch}-cmake \
      -DEXAMPLES=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libftdi1-$pkgver/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -f "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
