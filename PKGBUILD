# Maintainer: Sushil Khatri <esinkei at protonmail dot com>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
pkgname=quantum-espresso
pkgver=7.4.1
pkgrel=1
pkgdesc="A suite of codes for electronic-structure calculations and modeling"
arch=("x86_64")
url="https://www.quantum-espresso.org/"
license=('GPL2')
depends=('openmpi' 'glibc' 'libgfortran.so' 'blas-openblas' 'fftw')
makedepends=('gcc-fortran' 'cmake' 'gcc')
checkdepends=('python')
source=("https://gitlab.com/QEF/q-e/-/archive/qe-${pkgver}/q-e-qe-${pkgver}.tar.gz")
sha256sums=('6ef9c53dbf0add2a5bf5ad2a372c0bff935ad56c4472baa001003e4f932cab97')

build() {
  cd "$srcdir/q-e-qe-${pkgver}"
  mkdir build && cd build
  cmake \
	  -DCMAKE_C_COMPILER=mpicc \
	  -DCMAKE_Fortran_COMPILER=mpif90 \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  ..
  make -j
}

check() {
  cd "$srcdir/q-e-qe-${pkgver}"
  cd build
  ctest -j --output-on-failure -L unit
}

package() {
  cd "$srcdir/q-e-qe-${pkgver}"
  cd build
  make DESTDIR="$pkgdir" install
}
