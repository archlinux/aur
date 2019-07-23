# Maintainer: Simon Pintarelli <simon.pintarelli@cscs.ch>
pkgname=sirius-git
pkgver=VERSION
pkgrel=1
pkgdesc="Domain specific library for electronic structure calculations"
arch=('i686' 'x86_64')
url="https://github.com/electronic-structure/SIRIUS"
license=('GPL')
depends=(gsl fftw libxc scalapack openblas-lapack spglib hdf5 python-h5py python-mpi4py python-numpy python-scipy python-matplotlib)
makedepends=(cmake)
provides=('sirius')
options=('staticlibs')
source=("${pkgname%-*}::git+https://github.com/electronic-structure/SIRIUS.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  git submodule init
  git submodule update
  mkdir -p build
  cd build
  cmake -DCREATE_PYTHON_MODULE=On -DUSE_SCALAPACK=On -DCREATE_FORTRAN_BINDINGS=On -DCMAKE_BUILD_TYPE=RELEASE ../
}

package() {
  cd "$srcdir/${pkgname}"
  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
