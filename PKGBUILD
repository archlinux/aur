pkgname=mingw-w64-hdf5
pkgver=2.1.1
pkgrel=1
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (mingw-w64)"
url="https://www.hdfgroup.org/hdf5"
license=(BSD-3-Clause)
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libaec')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/HDFGroup/hdf5/releases/download/${pkgver}/hdf5-${pkgver}.tar.gz)
sha256sums=('efff93b5a904d66e8f626d7da60b5eedc9faf544be27dbabbaa87967b8ad798b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/hdf5-${pkgver}"
}

build() {
  cd "$srcdir/hdf5-${pkgver}"
  for _arch in $_architectures; do
    ${_arch}-cmake -B build-${_arch} \
      -DCMAKE_INCLUDE_DIRECTORIES_PROJECT_BEFORE=ON \
      -DHDF5_INSTALL_CMAKE_DIR="cmake/hdf5" \
      -DHDF5_ENABLE_ZLIB_SUPPORT=ON \
      -DHDF5_ENABLE_SZIP_SUPPORT=ON \
      -DHDF5_ENABLE_NONSTANDARD_FEATURES=OFF \
      -DHDF5_BUILD_CPP_LIB=ON \
      -DHDF5_BUILD_FORTRAN=ON \
      -DBUILD_TESTING=OFF \
      -DHDF5_BUILD_TOOLS=OFF \
      -DHDF5_BUILD_EXAMPLES=OFF \
      -DHDF5_BUILD_UTILS=OFF \
      -DH5_HAVE_VASPRINTF=0 \
      .
    make -C build-${_arch}
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir/hdf5-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
