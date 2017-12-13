
pkgname=mingw-w64-mlpack
pkgver=2.2.5
pkgrel=1
pkgdesc='a scalable c++ machine learning library (mingw-w64)'
arch=('any')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('mingw-w64-armadillo' 'mingw-w64-boost' 'mingw-w64-lapack' 'mingw-w64-libxml2')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.mlpack.org/files/mlpack-${pkgver}.tar.gz")
sha256sums=('e24e64d8451a3db23eafb7c94f9fa075dd540f5ac04953c82260a9d4d9fc4fcf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/mlpack-${pkgver}"
  # hack: load.cpp:22:114: error: duplicate explicit instantiation...
  sed -i "22d" src/mlpack/core/data/load.cpp
}

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

