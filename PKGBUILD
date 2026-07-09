pkgname=('mingw-w64-highs')
pkgver=1.15.1
pkgrel=1
pkgdesc='Linear optimization software (mingw-w64)'
url='https://github.com/ERGO-Code/HiGHS'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-zlib')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a840d269dff2fafb371dd247df13ad5e026d7ce3b35ad3dc1eedd59bf0c2fb16')

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
