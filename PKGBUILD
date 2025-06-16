pkgname=mingw-w64-proj
pkgver=9.6.2
pkgrel=1
arch=('any')
pkgdesc="Cartographic Projections library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-sqlite' 'mingw-w64-libtiff' 'mingw-w64-curl')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'mingw-w64-nlohmann-json')
options=('!strip' '!buildflags' 'staticlibs')
license=('MIT')
url="https://proj.org/"
source=("https://github.com/OSGeo/PROJ/releases/download/${pkgver}/proj-${pkgver}.tar.gz")
sha256sums=('53d0cafaee3bb2390264a38668ed31d90787de05e71378ad7a8f35bb34c575d1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/proj-${pkgver}
}

build() {
  cd "${srcdir}"/proj-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_TESTING=OFF -DBUILD_APPS=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/proj-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}"/usr/${_arch}/share/{doc,man}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
