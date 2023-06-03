pkgname=mingw-w64-proj
pkgver=9.2.1
pkgrel=1
arch=('any')
pkgdesc="Cartographic Projections library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-sqlite' 'mingw-w64-libtiff' 'mingw-w64-curl')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'mingw-w64-nlohmann-json')
options=('!strip' '!buildflags' 'staticlibs')
license=('MIT')
url="https://proj.org/"
source=("https://github.com/OSGeo/PROJ/releases/download/${pkgver}/proj-${pkgver}.tar.gz")
sha256sums=('15ebf4afa8744b9e6fccb5d571fc9f338dc3adcf99907d9e62d1af815d4971a1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/proj-${pkgver}
}

build() {
  cd "${srcdir}"/proj-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTING=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/proj-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    rm -r "${pkgdir}"/usr/${_arch}/share/{doc,man}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
