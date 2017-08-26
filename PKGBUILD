pkgname=mingw-w64-hdf5
pkgver=1.10.1
_pkgver=${pkgver}
pkgrel=1
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (mingw-w64)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'wine')
options=('!strip' '!buildflags' 'staticlibs')
source=("ftp://ftp.hdfgroup.org/HDF5/releases/hdf5-1.10/hdf5-${_pkgver}/src/hdf5-${_pkgver}.tar.bz2")
sha1sums=('22edee1f4ed603ea9544daec3492874fa3028bbb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/hdf5-${pkgver/_/-}"

  # run H5detect.exe, H5make_libsettings.exe through wine
  sed -i "s|set (CMD $<TARGET_FILE:H5|set (CMD wine $<TARGET_FILE:H5|g" src/CMakeLists.txt

  # do not use msvc import suffix
  sed -i "s|MINGW AND \${libtype} MATCHES \"SHARED\"|0|g" config/cmake_ext_mod/HDFMacros.cmake

  # dont add twice the lib prefix
  sed -i 's|set (LIB_RELEASE_NAME "lib\${libname}")|set (LIB_RELEASE_NAME "\${libname}")|g' config/cmake_ext_mod/HDFMacros.cmake
}

build() {
  cd "$srcdir/hdf5-${pkgver/_/-}"
  for _arch in $_architectures; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
      -DBUILD_TESTING=OFF \
      -DHDF5_BUILD_TOOLS=OFF \
      -DHDF5_BUILD_EXAMPLES=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir/hdf5-${pkgver/_/-}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/{COPYING,*.txt}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
