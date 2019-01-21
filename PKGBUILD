# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=chai
pkgver=1.1.0
pkgrel=1
pkgdesc="Copy-hiding array abstraction to automatically migrate data between memory spaces"
arch=('i686' 'x86_64')
url="http://raja.readthedocs.io/en/master/"
license=('BSD')
depends=('gcc-libs' 'gcc-fortran' 'openmpi')
makedepends=('cmake' 'cuda')
source=(git+https://github.com/LLNL/CHAI.git)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}"/CHAI
  git checkout v${pkgver}
  git submodule update --init --recursive
}

build() {
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_MPI=On \
    -DENABLE_FORTRAN=On \
    -DENABLE_OPENMP=On \
    -DENABLE_ROCM=On \
  ${srcdir}/CHAI
  make
}

check() {
  cd ${srcdir}/build
  make test
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}

