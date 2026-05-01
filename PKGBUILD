pkgname=mingw-w64-cgns
_PKGNAME=CGNS
pkgver=4.5.2
pkgrel=1
pkgdesc='Standard for recording and recovering computer data associated with the numerical solution of fluid dynamics equations (mingw-w64)'
arch=('any')
url='http://www.cgns.org'
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-hdf5')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${_PKGNAME}/${_PKGNAME}/archive/v${pkgver}.tar.gz)
sha256sums=('95075e1fd0b51d97b1b96b73ebe03b1a551fbcc9cd2b2b6f487ccccedcff5964')

_architectures="x86_64-w64-mingw32"

prepare(){
  cd "${srcdir}/${_PKGNAME}-${pkgver}"
}

build() {
  cd "${srcdir}/${_PKGNAME}-${pkgver}"
  for _arch in ${_architectures}; do
    if test "${_arch}" = "x86_64-w64-mingw32"
    then
      _64bits=ON
    else
      _64bits=OFF
    fi
    ${_arch}-cmake \
    -DCMAKE_UNITY_BUILD=OFF \
    -DCGNS_BUILD_CGNSTOOLS:BOOL=OFF \
    -DCGNS_ENABLE_64BIT:BOOL=${_64bits} \
    -DCGNS_ENABLE_FORTRAN:BOOL=OFF \
    -DCGNS_ENABLE_HDF5:BOOL=ON \
    -DCGNS_ENABLE_LEGACY:BOOL=ON \
    -DCGNS_ENABLE_SCOPING:BOOL=OFF \
    -DCGNS_ENABLE_TESTS:BOOL=OFF \
    -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir"/${_PKGNAME}-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/bin/*.bat
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
