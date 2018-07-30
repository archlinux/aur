
pkgname=mingw-w64-netcdf
pkgver=4.6.1
pkgrel=1
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library (mingw-w64)"
arch=('any')
url="http://www.unidata.ucar.edu/downloads/netcdf/index.jsp"
depends=('mingw-w64-crt' 'mingw-w64-hdf5' 'mingw-w64-curl' 'mingw-w64-dlfcn')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
license=('custom')
source=("http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-${pkgver}.tar.gz")
sha256sums=('89c7957458740b763ae828c345240b8a1d29c2c1fed0f065f99b73181b0b2642')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/netcdf-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DENABLE_TESTS=OFF -DBUILD_UTILITIES=OFF -DBUILD_SHARED_LIBS=OFF ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DENABLE_TESTS=OFF -DBUILD_UTILITIES=OFF ..
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/netcdf-${pkgver}/build-${_arch}-static
    make install DESTDIR="$pkgdir"
    cd "$srcdir"/netcdf-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
