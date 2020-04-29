pkgname=mingw-w64-sgpp
pkgver=3.3.0
pkgrel=1
arch=('any')
pkgdesc="A numerical library for adaptive Sparse Grids (mingw-w64)"
url="http://sgpp.sparsegrids.org"
license=('BSD')
depends=('mingw-w64-armadillo' 'mingw-w64-gsl' 'mingw-w64-suitesparse')
makedepends=('scons' 'mingw-w64-eigen')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/SGpp/SGpp/archive/v${pkgver}.tar.gz")
sha256sums=('ca4d5b79f315b425ce69b04940c141451a76848bf1bd7b96067217304c68e2d4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/SGpp-${pkgver}"
  # tweak umfpack include dir
  sed -i "s|suitesparse/umfpack.h|umfpack.h|g" base/SConscript base/src/sgpp/base/tools/sle/solver/UMFPACK.cpp

  # error: ‘n’ not specified in enclosing ‘parallel’
  sed -i "s|shared(system, A, nnz, rowsDone)|shared(system, A, nnz, rowsDone, n)|g" base/src/sgpp/base/tools/sle/solver/Armadillo.cpp base/src/sgpp/base/tools/sle/solver/Eigen.cpp base/src/sgpp/base/tools/sle/solver/Gmmpp.cpp
  sed -i "s|shared(system, Ti, Tj, Tx, nnz, rowsDone)|shared(system, Ti, Tj, Tx, nnz, rowsDone, n)|g" base/src/sgpp/base/tools/sle/solver/UMFPACK.cpp

  # in-progress :[
  # https://github.com/scons/scons/wiki/CrossCompilingMingw
  curl -fSsLO https://raw.githubusercontent.com/anholt/mesa/master/scons/crossmingw.py
  mv crossmingw.py site_scons
  
  cd "$srcdir/"
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    cp -r SGpp-${pkgver} build-${_arch}
  done
}

package()
{
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    scons COMPILER=gnu CC=${_arch}-gcc CXX=${_arch}-g++ BOOST_INCLUDE_PATH=/usr/${_arch}/include BOOST_LIBRARY_PATH=/usr/${_arch}/lib GSL_INCLUDE_PATH=/usr/${_arch}/include SG_PYTHON=0 SG_JAVA=0 COMPILE_BOOST_TESTS=0 USE_ARMADILLO=1 USE_EIGEN=1 USE_UMFPACK=1 PREFIX="$pkgdir"/usr/${_arch} CHECK_STYLE=0 -Q install ${MAKEFLAGS}
    mv "$pkgdir"/usr/${_arch}/lib/sgpp/* "$pkgdir"/usr/${_arch}/lib
    popd
  done
}
