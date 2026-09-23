pkgname=mingw-w64-netcdf
pkgver=4.10.1
pkgrel=1
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library (mingw-w64)"
arch=('any')
url="https://www.unidata.ucar.edu/software/netcdf/"
depends=('mingw-w64-zstd' 'mingw-w64-hdf5' 'mingw-w64-curl' 'mingw-w64-libxml2' 'mingw-w64-dlfcn' 'mingw-w64-libzip')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
license=('custom')
source=("https://github.com/Unidata/netcdf-c/archive/v${pkgver}.tar.gz")
sha256sums=('33c27231c478c3b35da7c7758fbdd02da1fe407abcb16ddfe195f69d164f930d')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare () {
  cd "${srcdir}/netcdf-c-${pkgver}"
  # undefined ref to libzip symbols
  echo "target_link_libraries(netcdf PRIVATE \${Zip_LIBRARIES})" >> CMakeLists.txt
}

build() {
  cd "${srcdir}/netcdf-c-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DNETCDF_ENABLE_TESTS=OFF -DNETCDF_BUILD_UTILITIES=OFF -DNETCDF_ENABLE_PLUGINS=OFF \
      -DNETCDF_ENABLE_LOGGING=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir"/netcdf-c-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
