pkgname=mingw-w64-hdf5
pkgver=1.8.14
pkgrel=2
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (mingw-w64)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'wine')
options=('!strip' '!buildflags' 'staticlibs')
source=("ftp://ftp.hdfgroup.org/HDF5/current/src/hdf5-${pkgver/_/-}.tar.bz2")
source=(https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.14/src/hdf5-1.8.14.tar.bz2)
sha1sums=('3c48bcb0d5fb21a3aa425ed035c08d8da3d5483a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/hdf5-${pkgver/_/-}"

  # do not rename import library ".lib"
  sed -i "s|MINGW AND \${libtype} MATCHES \"SHARED\"|0|g" config/cmake_ext_mod/HDFMacros.cmake

  # run H5detect.exe, H5make_libsettings.exe through wine
  sed -i "s|set (CMD $<TARGET_FILE:H5|set (CMD wine $<TARGET_FILE:H5|g" src/CMakeLists.txt
}

build() {
  cd "$srcdir/hdf5-${pkgver/_/-}"
  for _arch in $_architectures; do
    cmake_args="-DHDF5_BUILD_HL_LIB=ON \
      -DHAVE_IOEO_EXITCODE=1 \
      -DHDF5_PRINTF_LL_TEST=1 \
      -DH5_LDOUBLE_TO_INTEGER_WORKS=1 \
      -DH5_ULONG_TO_FLOAT_ACCURATE=1 \
      -DH5_LDOUBLE_TO_UINT_ACCURATE=1 \
      -DH5_FP_TO_ULLONG_ACCURATE=1 \
      -DH5_ULLONG_TO_LDOUBLE_PRECISION=1 \
      -DH5_FP_TO_INTEGER_OVERFLOW_WORKS=1 \
      -DH5_LDOUBLE_TO_LLONG_ACCURATE=1 \
      -DH5_LLONG_TO_LDOUBLE_CORRECT=1 \
      -DH5_NO_ALIGNMENT_RESTRICTIONS=1 \
      -DHDF5_PRINTF_LL_TEST_RUN=0 \
      -DHDF5_PRINTF_LL_TEST_RUN__TRYRUN_OUTPUT="
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS=OFF \
      ${cmake_args} \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      ${cmake_args} \
      ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir/hdf5-${pkgver/_/-}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    cd "$srcdir/hdf5-${pkgver/_/-}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/*.txt
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
