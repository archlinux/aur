# Maintainer: Sushil Khatri <esinkei at protonmail dot com>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
pkgname=quantum-espresso
pkgver=7.4
pkgrel=2
pkgdesc="A suite of codes for electronic-structure calculations and modeling"
arch=("x86_64")
url="https://www.quantum-espresso.org/"
license=('GPL2')
depends=('openmpi' 'glibc' 'libgfortran.so' 'blas-openblas' 'fftw')
makedepends=('gcc-fortran' 'cmake' 'gcc')
checkdepends=('python')
source=("https://gitlab.com/QEF/q-e/-/archive/qe-${pkgver}/q-e-qe-${pkgver}.tar.gz")
sha256sums=('b15dcfe25f4fbf15ccd34c1194021e90996393478226e601d876f7dea481d104')

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
