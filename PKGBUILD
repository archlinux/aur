pkgname=mingw-w64-netcdf
pkgver=4.8.1
pkgrel=1
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library (mingw-w64)"
arch=('any')
url="https://www.unidata.ucar.edu/software/netcdf/"
depends=('mingw-w64-crt' 'mingw-w64-hdf5' 'mingw-w64-curl' 'mingw-w64-dlfcn')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
license=('custom')
source=("https://github.com/Unidata/netcdf-c/archive/v${pkgver}.tar.gz")
sha256sums=('bc018cc30d5da402622bf76462480664c6668b55eb16ba205a0dfb8647161dd0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/netcdf-c-${pkgver}"
  # https://github.com/Unidata/netcdf-c/pull/2123
  sed -i "s|LIST(REMOVE_DUPLICATES TLL_LIBS)||g" liblib/CMakeLists.txt
}

build() {
  cd "${srcdir}/netcdf-c-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    # manually specify hdf5 paths as the exported cmake target is not using the hdf5 config properly
    ${_arch}-cmake -DENABLE_TESTS=OFF -DBUILD_UTILITIES=OFF \
      -DHDF5_C_LIBRARY=/usr/${_arch}/lib/libhdf5.dll.a \
      -DHDF5_HL_LIBRARY=/usr/${_arch}/lib/libhdf5_hl.dll.a \
      -DHDF5_INCLUDE_DIR=/usr/${_arch}/include/ \
      -DHDF5_VERSION=1.12.1  \
      ..
    make
    popd
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
