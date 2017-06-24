
pkgname=mingw-w64-armadillo
pkgver=7.950.1
pkgrel=1
pkgdesc="C++ linear algebra library (mingw-w64)"
arch=('any')
url="http://arma.sourceforge.net/"
license=('MPL 2.0')
depends=('mingw-w64-lapack' 'mingw-w64-hdf5')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/sourceforge/arma/armadillo-$pkgver.tar.xz")
sha512sums=('e061a09ba45359c6a1d422cbb1586b2c1d3d5edaec8a0a885030c4aa3295eb5b90b45df6e4d5bec6ca57d290020a33afc8ed9a940a08b3ec0f0736a278b0484d')

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

