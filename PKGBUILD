pkgname=mingw-w64-hdf5
pkgver=1.10.2
_pkgver=${pkgver}
pkgrel=1
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (mingw-w64)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${pkgver:0:4}/hdf5-${pkgver/_/-}/src/hdf5-${pkgver/_/-}.tar.bz2"
        attribute-before-function.patch)
sha256sums=('1cad5b7bfdf128dfc53cd16fba48f6e7ae4e93c75c371d9ec8dfc4df0c1fcb71'
            '951d81d98f855c2f81e2d6e3f349217d1c452b59aa5ae03ecfe6c6eeed49cb3a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/hdf5-${pkgver/_/-}"

  # run H5detect.exe, H5make_libsettings.exe through wine
  cp src/CMakeLists.txt src/CMakeLists.txt.orig

  # do not use msvc import suffix
  sed -i "s|MINGW AND \${libtype} MATCHES \"SHARED\"|0|g" config/cmake_ext_mod/HDFMacros.cmake

  # dont add twice the lib prefix
  sed -i 's|set (LIB_RELEASE_NAME "lib\${libname}")|set (LIB_RELEASE_NAME "\${libname}")|g' config/cmake_ext_mod/HDFMacros.cmake

  # https://bitbucket.hdfgroup.org/projects/HDFFV/repos/hdf5/commits/d6ea76ac002cd8483ba8a6aaf55bbce5ed552937
  patch -p1 -i "$srcdir"/attribute-before-function.patch

  # H5win32defs.h:57:66: error: expected expression before ‘)’ token
  sed -i "s|_O_BINARY, __VA_ARGS__)|_O_BINARY, ## __VA_ARGS__)|g" src/H5win32defs.h

  # fix cmake config location
  sed -i 's|_INSTALL_DATA_DIR "."|_INSTALL_DATA_DIR share|g' config/cmake_ext_mod/HDFMacros.cmake
  sed -i 's|_INSTALL_CMAKE_DIR cmake|_INSTALL_CMAKE_DIR share/cmake|g' config/cmake_ext_mod/HDFMacros.cmake
}

build() {
  cd "$srcdir/hdf5-${pkgver/_/-}"
  for _arch in $_architectures; do
    sed "s|COMMAND \$<TARGET_FILE:H5|COMMAND /usr/bin/${_arch}-wine \$<TARGET_FILE:H5|g" src/CMakeLists.txt.orig > src/CMakeLists.txt
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
    cd "$srcdir/hdf5-${_arch}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/share/{COPYING,*.txt}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
