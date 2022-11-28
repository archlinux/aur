# Maintainer: Sushil Khatri <esinkei at protonmail dot com>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
pkgname=quantum-espresso
pkgver=7.1
pkgrel=1
pkgdesc="A suite of codes for electronic-structure calculations and modeling"
arch=("x86_64")
url="https://www.quantum-espresso.org/"
license=('GPL2')
depends=('openmpi' 'gcc-fortran' 'fftw' 'elpa' 'libxc')
makedepends=('gcc-fortran' 'cmake')
checkdepends=('python')
source=("https://gitlab.com/QEF/q-e/-/archive/qe-${pkgver}/q-e-qe-${pkgver}.tar.gz")
sha256sums=('d56dea096635808843bd5a9be2dee3d1f60407c01dbeeda03f8256a3bcfc4eb6')

build() {
  cd "$srcdir/q-e-qe-${pkgver}"
  mkdir build && cd build
  cmake -DCMAKE_C_COMPILER=mpicc -DCMAKE_Fortran_COMPILER=mpifort -DQE_ENABLE_TEST=ON -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
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
  make PREFIX="$pkgdir/usr" install
}
