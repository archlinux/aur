pkgname=mingw-w64-hdf5
pkgver=1.10.0_patch1
_pkgver=1.10.0-patch1
pkgrel=1
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (mingw-w64)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'wine')
options=('!strip' '!buildflags' 'staticlibs')
sha1sums=('82ed248e5d0293bc1dba4c13c9b2880a26643ee0')
source=(ftp://ftp.hdfgroup.org/HDF5/releases/hdf5-1.10/hdf5-${_pkgver}/src/hdf5-${_pkgver}.tar.bz2)
sha1sums=('2f34251186fa9e59887d8f094bc0bc90187d0aa4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/hdf5-${pkgver/_/-}"

  # do not rename import library ".lib"
  sed -i "s|MINGW AND \${libtype} MATCHES \"SHARED\"|0|g" config/cmake_ext_mod/HDFMacros.cmake

  # run H5detect.exe, H5make_libsettings.exe through wine
  sed -i "s|set (CMD $<TARGET_FILE:H5|set (CMD wine $<TARGET_FILE:H5|g" src/CMakeLists.txt

  # error: redefinition of ‘struct timezone’
  sed -i "s|struct timezone {|struct timezonezzzz {|g" src/H5win32defs.h
}

build() {
  cd "$srcdir/hdf5-${pkgver/_/-}"
  for _arch in $_architectures; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTING=OFF \
      -DHDF5_BUILD_TOOLS=OFF \
      -DHDF5_BUILD_EXAMPLES=OFF \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTING=OFF \
      -DHDF5_BUILD_TOOLS=OFF \
      -DHDF5_BUILD_EXAMPLES=OFF \
      -DBUILD_SHARED_LIBS=ON \
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
    rm "$pkgdir"/usr/${_arch}/{COPYING,*.txt}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
