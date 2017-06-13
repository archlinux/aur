pkgname=mingw-w64-netcdf-cxx-legacy
spkgname=netcdf-cxx
pkgver=4.2
pkgrel=1
pkgdesc="Backward compatible netCDF C++ library (mingw-w64)"
arch=("any")
url="http://www.unidata.ucar.edu/downloads/netcdf/netcdf-cxx"
depends=('mingw-w64-netcdf')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
license=('GPL')
source=("ftp://ftp.unidata.ucar.edu/pub/netcdf/${spkgname}-${pkgver}.tar.gz")
md5sums=('d32b20c00f144ae6565d9e98d9f6204c')

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
