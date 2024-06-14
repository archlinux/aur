# Maintainer: Sushil Khatri <esinkei at protonmail dot com>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
pkgname=quantum-espresso
pkgver=7.3.1
pkgrel=1
pkgdesc="A suite of codes for electronic-structure calculations and modeling"
arch=("x86_64")
url="https://www.quantum-espresso.org/"
license=('GPL2')
depends=('openmpi' 'glibc' 'libgfortran.so' 'intel-oneapi-mkl')
makedepends=('gcc-fortran' 'cmake' 'gcc')
source=("https://gitlab.com/QEF/q-e/-/archive/qe-${pkgver}/q-e-qe-${pkgver}.tar.gz")
sha256sums=('2c58b8fadfe4177de5a8b69eba447db5e623420b070dea6fd26c1533b081d844')

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
