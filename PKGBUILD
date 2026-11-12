pkgname=('mingw-w64-highs')
pkgver=1.16.0
pkgrel=1
pkgdesc='Linear optimization software (mingw-w64)'
url='https://github.com/ERGO-Code/HiGHS'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-zlib')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0fa9da512955fb08c6cca7bfb274ca12e8a0e8a12e44189bd6e0c355ce7701bc')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd HiGHS-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_CXX_EXE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DCMAKE_UNITY_BUILD=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "${srcdir}/HiGHS-$pkgver"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --build build-${_arch} --target install
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
