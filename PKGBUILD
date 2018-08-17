# Maintainer: Andrew Sun <adsun701@gmail.com

pkgname=mingw-w64-geos
pkgver=3.6.3
pkgrel=1
pkgdesc="C++ port of the Java Topology Suite (mingw-w64)"
arch=('any')
url="http://trac.osgeo.org/geos/"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!emptydirs' '!buildflags' '!strip' 'staticlibs')
source=("http://download.osgeo.org/geos/geos-${pkgver}.tar.bz2"
        "geos-3.5.0.patch")
sha256sums=('ab9eaa0a67f7068866ac1e4dbf717b0c49f96254d65e9ce23ed7af1cccbe3e4b'
            '778ea9e73e343396c761e66a67c87b2054a33be629fa94a6243f7bdd7ab68346')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/geos-${pkgver}"
  patch -Np1 -i "${srcdir}/geos-3.5.0.patch"
}

build() {
  cd "${srcdir}/geos-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DGEOS_ENABLE_INLINE=OFF \
      ..
    make
    popd
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
