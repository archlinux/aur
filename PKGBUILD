pkgname=mingw-w64-geos
pkgver=3.12.2
pkgrel=1
pkgdesc="C++ port of the Java Topology Suite (mingw-w64)"
arch=('any')
url="https://trac.osgeo.org/geos/"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!emptydirs' '!buildflags' '!strip' 'staticlibs')
source=("https://download.osgeo.org/geos/geos-${pkgver}.tar.bz2")
sha256sums=('34c7770bf0090ee88488af98767d08e779f124fa33437e0aabec8abd4609fec6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/geos-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake \
      -DDISABLE_GEOS_INLINE=ON \
      -DBUILD_TESTING=OFF -DBUILD_BENCHMARKS=OFF \
      -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/geos-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    install -d "$pkgdir"/usr/bin
    ln -s /usr/${_arch}/bin/${_arch}-geos-config "$pkgdir"/usr/bin/${_arch}-geos-config
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
