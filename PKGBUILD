pkgname=mingw-w64-hdf5
pkgver=1.10.5
_pkgver=${pkgver}
pkgrel=1
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (mingw-w64)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${pkgver:0:4}/hdf5-${pkgver/_/-}/src/hdf5-${pkgver/_/-}.tar.bz2")
sha256sums=('68d6ea8843d2a106ec6a7828564c1689c7a85714a35d8efafa2fee20ca366f44')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/hdf5-${pkgver/_/-}"

  # https://bitbucket.hdfgroup.org/projects/HDFFV/repos/hdf5/commits/bc35bf6b3ede9c8069d9bda4c08dc7b7fb230cc5#src/CMakeLists.txt
  sed -i "s|COMMAND \${CMAKE_CROSSCOMPILING_EMULATOR}\$<TARGET_FILE:H5|COMMAND \${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE:H5|g" src/CMakeLists.txt

  # do not use msvc import suffix
  sed -i "s|MINGW AND \${libtype} MATCHES \"SHARED\"|0|g" config/cmake_ext_mod/HDFMacros.cmake

  # dont add twice the lib prefix
  sed -i 's|set (LIB_RELEASE_NAME "lib\${libname}")|set (LIB_RELEASE_NAME "\${libname}")|g' config/cmake_ext_mod/HDFMacros.cmake

  # H5win32defs.h:57:66: error: expected expression before ‘)’ token
  sed -i "s|_O_BINARY, __VA_ARGS__)|_O_BINARY, ## __VA_ARGS__)|g" src/H5win32defs.h

  # fix cmake config location
  sed -i 's|_INSTALL_DATA_DIR "."|_INSTALL_DATA_DIR share|g' config/cmake_ext_mod/HDFMacros.cmake
  sed -i 's|_INSTALL_CMAKE_DIR cmake|_INSTALL_CMAKE_DIR share/cmake|g' config/cmake_ext_mod/HDFMacros.cmake
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
    LD_PRELOAD="" make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/share/{COPYING,*.txt}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
