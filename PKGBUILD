
pkgname=mingw-w64-netcdf
pkgver=4.5.0
pkgrel=1
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library (mingw-w64)"
arch=('any')
url="http://www.unidata.ucar.edu/downloads/netcdf/index.jsp"
depends=('mingw-w64-crt' 'mingw-w64-hdf5' 'mingw-w64-curl' 'mingw-w64-dlfcn')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
license=('custom')
source=(http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-${pkgver}.tar.gz)
sha256sums=('cbe70049cf1643c4ad7453f86510811436c9580cb7a1684ada2f32b95b00ca79')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/netcdf-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --enable-dll --enable-netcdf-4 --disable-utilities
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/netcdf-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.def
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
