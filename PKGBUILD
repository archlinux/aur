pkgname=('mingw-w64-highs')
pkgver=1.15.0
pkgrel=1
pkgdesc='Linear optimization software (mingw-w64)'
url='https://github.com/ERGO-Code/HiGHS'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-zlib')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c3fc3e9ee43e6d562361f8647b4c69f958c95356a1af8bc5a3647f5882230d44')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd HiGHS-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_CXX_EXE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DCMAKE_UNITY_BUILD=ON -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/HiGHS-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
