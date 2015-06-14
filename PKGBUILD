pkgname=mingw-w64-geographiclib
_pkgname=GeographicLib
pkgver=1.42
pkgrel=1
pkgdesc="Set of C++ classes for conversions between geographic, UTM, UPS, MGRS, geocentric, and local cartesian coordinates, for gravity, geoid height, and geomagnetic field calculations and for solving geodesic problems. Geotrans replacement."
arch=(any)
url="http://geographiclib.sourceforge.net/"
license=("custom") # MIT/X11
makedepends=(mingw-w64-gcc
             mingw-w64-cmake)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/project/geographiclib/distrib/${_pkgname}-${pkgver}.tar.gz")
conflicts=(mingw-w64-geographiclib-static)
provides=(mingw-w64-geographiclib-static)
md5sums=('114a334765b9c416a2de3dfc72c22d6d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DGEOGRAPHICLIB_DOCUMENTATION=0 \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/doc" "$pkgdir/usr/${_arch}/matlab" "$pkgdir/usr/${_arch}/python"
  done
}
