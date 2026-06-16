pkgname=mingw-w64-openxlsx
pkgver=0.5.1
pkgrel=1
pkgdesc="A C++ library for reading, writing, creating and modifying Microsoft Excel (.xlsx) files (mingw-w64)"
arch=('any')
url="https://github.com/troldal/OpenXLSX"
license=('BSD-3-Clause')
depends=('mingw-w64-crt' 'mingw-w64-libzip' 'mingw-w64-pugixml' 'mingw-w64-boost')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/troldal/OpenXLSX/archive/v${pkgver}.tar.gz")
sha256sums=('ad31b3774772c163472ec016020df66743879cbe3eaac770be3e198d950286b9')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd OpenXLSX-$pkgver
}

build() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_UNITY_BUILD=ON \
      -DOPENXLSX_LIBRARY_TYPE=SHARED \
      -DOPENXLSX_ENABLE_LIBZIP=ON \
      -DOPENXLSX_BUILD_SAMPLES=OFF \
      -DOPENXLSX_CREATE_DOCS=OFF \
      -DOPENXLSX_NOWIDE_STANDALONE=OFF \
      -DUSE_SYSTEM_LIBS=ON -B build-${_arch} -DPREFER_STATIC=OFF -DTARGET_SHARED=.
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/OpenXLSX-${pkgver}/"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
