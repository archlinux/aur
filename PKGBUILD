
pkgname=mingw-w64-armadillo
pkgver=9.500.2
pkgrel=1
pkgdesc="C++ linear algebra library (mingw-w64)"
arch=('any')
url="http://arma.sourceforge.net/"
license=('MPL 2.0')
depends=('mingw-w64-arpack' 'mingw-w64-hdf5')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/sourceforge/arma/armadillo-$pkgver.tar.xz")
sha256sums=('0b1a3e07a6ae4d98c69dd3a6a84262574c88e491c9215147236ee5bf957fd79e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/armadillo-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF ..
    make 
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/armadillo-$pkgver/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    cd "${srcdir}/armadillo-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}

