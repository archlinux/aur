pkgname=quantum-espresso
pkgver=7.6
pkgrel=1
pkgdesc="A suite of codes for electronic-structure calculations and modeling"
arch=("x86_64")
url="https://www.quantum-espresso.org/"
license=('GPL2')
depends=('openmpi' 'glibc' 'libgfortran.so' 'blas-openblas' 'fftw')
makedepends=('gcc-fortran' 'cmake' 'gcc')
checkdepends=('python')
source=("https://gitlab.com/QEF/q-e/-/archive/qe-${pkgver}/q-e-qe-${pkgver}.tar.gz")
sha256sums=('945c8f16ab330c8f0b30f4de1a9a088b85038476fcd819394e641f4d2d8b7d51')

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
