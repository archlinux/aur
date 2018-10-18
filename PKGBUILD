pkgname=mingw-w64-netcdf-cxx-legacy
spkgname=netcdf-cxx
pkgver=4.2
pkgrel=2
pkgdesc="Backward compatible netCDF C++ library (mingw-w64)"
arch=("any")
url="http://www.unidata.ucar.edu/downloads/netcdf/netcdf-cxx"
depends=('mingw-w64-netcdf')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
license=('GPL')
source=("http://www.gfd-dennou.org/arch/netcdf/unidata-mirror/netcdf-cxx-${pkgver}.tar.gz")
sha256sums=('95ed6ab49a0ee001255eac4e44aacb5ca4ea96ba850c08337a3e4c9a0872ccd1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/${spkgname}-${pkgver}
  sed -i "s|libnetcdf_c___la_LDFLAGS = -version|libnetcdf_c___la_LDFLAGS = -no-undefined -version|g" cxx/Makefile.am
  autoreconf -vfi
}

build() {
  cd "${srcdir}"/${spkgname}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/${spkgname}-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
