
pkgname=mingw-w64-mlpack
pkgver=2.1.0
pkgrel=1
pkgdesc='a scalable c++ machine learning library (mingw-w64)'
arch=('any')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('mingw-w64-armadillo' 'mingw-w64-boost' 'mingw-w64-lapack' 'mingw-w64-libxml2')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.mlpack.org/files/mlpack-${pkgver}.tar.gz")
sha1sums=('373a78d5f07216f5523ac0b8d8cc002f98eddd25')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/mlpack-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTS=OFF -DBUILD_CLI_EXECUTABLES=OFF ..
    make -j1 # some compile steps take much memory
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mlpack-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
