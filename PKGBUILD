pkgname=mingw-w64-mlpack
pkgver=3.3.0
pkgrel=1
pkgdesc='a scalable c++ machine learning library (mingw-w64)'
arch=('any')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('mingw-w64-armadillo' 'mingw-w64-boost' 'mingw-w64-lapack' 'mingw-w64-libxml2')
makedepends=('mingw-w64-cmake' 'mingw-w64-ensmallen' 'mingw-w64-stb')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.mlpack.org/files/mlpack-${pkgver}.tar.gz")
sha256sums=('63cdc3569f2e929899cc30c2e808a42709723c2ea56f8c2953edc7188eab5559')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/mlpack-${pkgver}"
}

build() {
  cd "${srcdir}/mlpack-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTS=OFF -DBUILD_CLI_EXECUTABLES=OFF \
      -DBUILD_PYTHON_BINDINGS=OFF -DBUILD_JULIA_BINDINGS=OFF \
      -DDISABLE_DOWNLOADS=ON ..
    make
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

