pkgname=mingw-w64-netcdf-cxx
pkgver=4.3.0
pkgrel=1
pkgdesc="NetCDF c++ bindings (mingw-w64)"
arch=("any")
url="http://www.unidata.ucar.edu/downloads/netcdf/netcdf-cxx/index.jsp"
depends=('mingw-w64-netcdf')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
license=('custom')
source=("http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-cxx4-${pkgver}.tar.gz")
sha1sums=('796d71c7aae8bc15e923d5c5b50a54bcc7538f0c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/netcdf-cxx4-${pkgver}
  sed -i "s|libnetcdf_c__4_la_LDFLAGS = -version-info|libnetcdf_c__4_la_LDFLAGS = -no-undefined -version-info|g" cxx4/Makefile.am
  autoreconf -vfi
}

build() {
  cd ${srcdir}/netcdf-cxx4-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/netcdf-cxx4-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
