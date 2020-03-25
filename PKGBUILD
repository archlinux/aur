pkgname=sgpp
pkgver=3.3.0
pkgrel=1
arch=('x86_64')
pkgdesc="A numerical library for adaptive Sparse Grids"
url="http://sgpp.sparsegrids.org"
license=('BSD')
depends=('armadillo' 'python' 'gsl' 'gmm' 'suitesparse')
makedepends=('scons' 'swig' 'eigen')
source=("https://github.com/SGpp/SGpp/archive/v${pkgver}.tar.gz")
sha256sums=('ca4d5b79f315b425ce69b04940c141451a76848bf1bd7b96067217304c68e2d4')

prepare() {
  cd "$srcdir/SGpp-${pkgver}"
  # tweak umfpack include dir
  sed -i "s|suitesparse/umfpack.h|umfpack.h|g" base/SConscript base/src/sgpp/base/tools/sle/solver/UMFPACK.cpp

  # error: ‘n’ not specified in enclosing ‘parallel’
  sed -i "s|shared(system, A, nnz, rowsDone)|shared(system, A, nnz, rowsDone, n)|g" base/src/sgpp/base/tools/sle/solver/Armadillo.cpp base/src/sgpp/base/tools/sle/solver/Eigen.cpp base/src/sgpp/base/tools/sle/solver/Gmmpp.cpp
  sed -i "s|shared(system, Ti, Tj, Tx, nnz, rowsDone)|shared(system, Ti, Tj, Tx, nnz, rowsDone, n)|g" base/src/sgpp/base/tools/sle/solver/UMFPACK.cpp
}

package()
{
  cd "$srcdir/SGpp-${pkgver}"
  scons SG_JAVA=0 COMPILE_BOOST_TESTS=0 RUN_PYTHON_TESTS=0 USE_ARMADILLO=1 USE_EIGEN=1 USE_GMMPP=1 USE_UMFPACK=1 PREFIX="$pkgdir"/usr/ -Q install ${MAKEFLAGS}
  install -d "$pkgdir"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
  cp -Lr lib/pysgpp "$pkgdir"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
}
