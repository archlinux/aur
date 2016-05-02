
pkgname=mingw-w64-armadillo
pkgver=6.700.5
pkgrel=1
pkgdesc="C++ linear algebra library (mingw-w64)"
arch=('any')
url="http://arma.sourceforge.net/"
license=('MPL 2.0')
depends=('mingw-w64-lapack' 'mingw-w64-hdf5')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/sourceforge/arma/armadillo-$pkgver.tar.gz")
sha512sums=('1472056a809cc9f79c4e235c871253c689aa359c05efb158c98c8816b9ce7e4997e17bdaf6965711b3d1cc408d2ca74e1d438dcc5aa08cd322b352935f75887d')

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

