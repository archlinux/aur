pkgname=('mingw-w64-highs')
pkgver=1.11.0
pkgrel=1
pkgdesc='Linear optimization software (mingw-w64)'
url='https://github.com/ERGO-Code/HiGHS'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-zlib')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2b44b074cf41439325ce4d0bbdac2d51379f56faf17ba15320a410d3c1f07275')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd HiGHS-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_CXX_EXE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/HiGHS-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
