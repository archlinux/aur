# Maintainer: Simon Pintarelli <simon.pintarelli@cscs.ch>
pkgname=sirius-git
_pkgname=sirius
pkgver=r6480.1608ef6f
pkgrel=2
pkgdesc="Domain specific library for electronic structure calculations"
arch=('i686' 'x86_64')
url="https://github.com/electronic-structure/SIRIUS"
license=('GPL')
depends=(cuda gsl spfft-cuda-git fftw libxc scalapack openblas-lapack spglib hdf5 python-h5py python-mpi4py python-numpy python-scipy python-matplotlib)
makedepends=(cmake)
provides=('sirius')
options=('staticlibs')
source=("${pkgname%-*}::git+https://github.com/electronic-structure/SIRIUS.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  git submodule init
  git submodule update
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCREATE_PYTHON_MODULE=On \
        -DUSE_SCALAPACK=On \
        -DUSE_CUDA=On \
        -DCREATE_FORTRAN_BINDINGS=On \
        -DCMAKE_BUILD_TYPE=RELEASE ../
  make -j
}

package() {
  cd "$srcdir/${_pkgname}"
  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
