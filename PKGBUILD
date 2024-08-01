pkgname=mingw-w64-hdf5
pkgver=1.14.4.3
pkgrel=2
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (mingw-w64)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libaec')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/HDFGroup/hdf5/archive/hdf5_$pkgver/hdf5-$pkgver.tar.gz)
sha256sums=('690c1db7ba0fed4ffac61709236675ffd99d95d191e8920ee79c58d7e7ea3361')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/hdf5-hdf5_${pkgver}"
  curl -L https://github.com/HDFGroup/hdf5/pull/4466.patch | patch -p1
  curl -L https://github.com/HDFGroup/hdf5/pull/4467.patch | patch -p1
  curl -L https://github.com/HDFGroup/hdf5/pull/4473.patch | patch -p1
}

build() {
  cd "$srcdir/hdf5-hdf5_${pkgver}"
  for _arch in $_architectures; do
    ${_arch}-cmake -B build-${_arch} \
      -DCMAKE_INCLUDE_DIRECTORIES_PROJECT_BEFORE=ON \
      -DHDF5_INSTALL_CMAKE_DIR="cmake/hdf5" \
      -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
      -DHDF5_ENABLE_SZIP_SUPPORT=ON \
      -DUSE_LIBAEC=ON \
      -DHDF5_BUILD_CPP_LIB=ON \
      -DHDF5_BUILD_FORTRAN=ON \
      -DBUILD_TESTING=OFF \
      -DHDF5_BUILD_TOOLS=OFF \
      -DHDF5_BUILD_EXAMPLES=OFF \
      -DHDF5_BUILD_UTILS=OFF \
      -D_PAC_C_MAX_REAL_PRECISION=33 \
      -DH5_HAVE_VASPRINTF=0 \
      .
    make -C build-${_arch}
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir/hdf5-hdf5_${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/share/{COPYING,*.txt}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
