# Maintainer: Simon Pintarelli <simon.pintarelli@cscs.ch>
pkgname=sirius-git
_pkgname=sirius
pkgver=v7.4.3.r41.ga7de2eb
pkgrel=1
pkgdesc="Domain specific library for electronic structure calculations"
arch=(x86_64)
url="https://github.com/electronic-structure/SIRIUS"
license=('GPL')
depends=(gcc-libs glibc cuda gsl spfft spla fftw libxc scalapack blas-openblas spglib hdf5 python-h5py python-mpi4py python-numpy python-scipy python-matplotlib)
makedepends=(cmake git)
provides=('sirius')
options=('staticlibs')
source=("${pkgname%-*}::git+https://github.com/electronic-structure/SIRIUS.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCREATE_PYTHON_MODULE=On \
        -DUSE_SCALAPACK=On \
        -DUSE_CUDA=On \
        -DUSE_MEMORY_POOL=Off \
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
