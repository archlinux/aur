
pkgname=mingw-w64-armadillo
pkgver=7.500.2
pkgrel=1
pkgdesc="C++ linear algebra library (mingw-w64)"
arch=('any')
url="http://arma.sourceforge.net/"
license=('MPL 2.0')
depends=('mingw-w64-lapack' 'mingw-w64-hdf5')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/sourceforge/arma/armadillo-$pkgver.tar.xz")
sha512sums=('1f73944fa26eec93973630a7f101ca875de8decf9cbd6d7f87431a43e855479d5e79775823ba2e97e8d2615902deebd98af65808a529af16d6f8d88de60703d3')

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

