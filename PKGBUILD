pkgname=mingw-w64-cgns
_PKGNAME=CGNS
pkgver=3.3.0
pkgrel=1
pkgdesc='Standard for recording and recovering computer data associated with the numerical solution of fluid dynamics equations (mingw-w64)'
arch=('any')
url='http://www.cgns.org'
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-hdf5')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${_PKGNAME}/${_PKGNAME}/archive/v${pkgver}.tar.gz)
sha256sums=('8422c67994f8dc6a2f201523a14f6c7d7e16313bdd404c460c16079dbeafc662')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare(){
  cd "${srcdir}/${_PKGNAME}-${pkgver}"

  # https://github.com/CGNS/CGNS/pull/41
  sed -i "s| _declspec| __declspec|g" src/cgnslib.h src/cgns_io.h src/cgns_header.h src/adf/ADF.h src/cgio_ftoc.c
  sed -i "s|RUNTIME DESTINATION lib|RUNTIME DESTINATION bin|g" src/CMakeLists.txt
  sed -i "72,77d" src/tools/CMakeLists.txt
}

build() {
  cd "${srcdir}/${_PKGNAME}-${pkgver}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    if test "$_arch" = "x86_64-w64-mingw32"
    then
      _64bits=ON
    else
      _64bits=OFF
    fi
    ${_arch}-cmake \
    -DCGNS_BUILD_CGNSTOOLS:BOOL=OFF \
    -DCGNS_ENABLE_64BIT:BOOL=${_64bits} \
    -DCGNS_ENABLE_FORTRAN:BOOL=OFF \
    -DCGNS_ENABLE_HDF5:BOOL=OFF \
    -DCGNS_ENABLE_LEGACY:BOOL=ON \
    -DCGNS_ENABLE_SCOPING:BOOL=OFF \
    -DCGNS_ENABLE_TESTS:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/${_PKGNAME}-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/bin/*.bat
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
