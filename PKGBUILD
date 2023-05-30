pkgname=mingw-w64-openxlsx
pkgver=0.3.2
pkgrel=1
pkgdesc="A C++ library for reading, writing, creating and modifying Microsoft Excel (.xlsx) files (mingw-w64)"
arch=('any')
url="https://github.com/troldal/OpenXLSX"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/troldal/OpenXLSX/archive/v${pkgver}.tar.gz")
sha256sums=('e379f29a8ba4c4c33a2ef0589cf2fbc956411514748b2b7b45aaeff393e52cb3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DOPENXLSX_LIBRARY_TYPE=SHARED ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/OpenXLSX-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
