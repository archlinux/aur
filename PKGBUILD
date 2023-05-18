pkgname=mingw-w64-hdf5
pkgver=1.14.1
pkgrel=1
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (mingw-w64)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libaec')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${pkgver:0:4}/hdf5-${pkgver/_/-}/src/hdf5-${pkgver/_/-}-2.tar.bz2")
sha256sums=('06ca141d1a3c312b5d7cc4826a12737293ae131031748861689f6a2ec8219dbd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/hdf5-${pkgver/_/-}-2"
}

build() {
  cd "$srcdir/hdf5-${pkgver/_/-}-2"
  for _arch in $_architectures; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_INCLUDE_DIRECTORIES_PROJECT_BEFORE=ON \
      -DHDF5_INSTALL_CMAKE_DIR="lib/cmake" \
      -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
      -DHDF5_ENABLE_SZIP_SUPPORT=ON \
      -DHDF5_BUILD_CPP_LIB=ON \
      -DHDF5_BUILD_FORTRAN=ON \
      -DBUILD_TESTING=OFF \
      -DHDF5_BUILD_TOOLS=OFF \
      -DHDF5_BUILD_EXAMPLES=OFF \
      -D_PAC_C_MAX_REAL_PRECISION=33 \
      ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir/hdf5-${pkgver/_/-}-2/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/share/{COPYING,*.txt}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
