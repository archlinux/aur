pkgname=mingw-w64-netcdf
pkgver=4.9.3
pkgrel=2
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library (mingw-w64)"
arch=('any')
url="https://www.unidata.ucar.edu/software/netcdf/"
depends=('mingw-w64-zstd' 'mingw-w64-hdf5' 'mingw-w64-curl' 'mingw-w64-libxml2' 'mingw-w64-dlfcn')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
license=('custom')
source=("https://github.com/Unidata/netcdf-c/archive/v${pkgver}.tar.gz")
sha256sums=('990f46d49525d6ab5dc4249f8684c6deeaf54de6fec63a187e9fb382cc0ffdff')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/netcdf-c-${pkgver}"
}

build() {
  cd "${srcdir}/netcdf-c-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DNETCDF_ENABLE_TESTS=OFF -DNETCDF_BUILD_UTILITIES=OFF -DNETCDF_ENABLE_PLUGINS=OFF \
      -DCMAKE_UNITY_BUILD=ON -DNETCDF_ENABLE_LOGGING=ON -B build-${_arch} .
    make -C build-${_arch}
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/netcdf-c-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
