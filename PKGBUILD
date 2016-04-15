
pkgname=mingw-w64-mlpack
pkgver=2.0.1
pkgrel=1
pkgdesc='a scalable c++ machine learning library (mingw-w64)'
arch=('any')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('mingw-w64-armadillo' 'mingw-w64-boost' 'mingw-w64-lapack' 'mingw-w64-libxml2')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.mlpack.org/files/mlpack-${pkgver}.tar.gz"
        'kmeans_impl.patch')
sha1sums=('27df05cff83d202f5d64a3d3fa4bdc4d9a6bc4be'
          '0d9801873e44d340185081b9d1398bf60a37771b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/mlpack-${pkgver}"

  # https://github.com/mlpack/mlpack/commit/c751e61c8e37360c93b664597c189fb984f32de2
  patch -Np1 < "${srcdir}/kmeans_impl.patch"

  # https://github.com/mlpack/mlpack/pull/615
  sed -i "s|Windows.h|windows.h|g" src/mlpack/tests/cli_test.cpp

  # disable tests, proposed in https://github.com/mlpack/mlpack/pull/616
  sed -i "/tests/d" src/mlpack/CMakeLists.txt
}

build() {
  cd "${srcdir}/mlpack-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF -DDEBUG=OFF -DPROFILE=OFF ..
    make -j1 # some compile steps take much memory
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mlpack-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
#     ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
