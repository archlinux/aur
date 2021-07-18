# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=quantum-espresso
pkgver=6.7
pkgrel=1
pkgdesc="A suite of codes for electronic-structure calculations and modeling"
arch=("x86_64")
url="https://www.quantum-espresso.org/"
license=('GPL2')
depends=('libxc' 'elpa' 'fftw')
makedepends=('gcc-fortran')
checkdepends=('python')
source=("https://gitlab.com/QEF/q-e/-/archive/qe-${pkgver}MaX-Release/q-e-qe-${pkgver}MaX-Release.tar.bz2")
sha256sums=('c67429353d49142b675ba6deefbde9594159518bf331aac187ee45a46d02734d')
options=(!buildflags)

prepare() {
  export _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
  mv "$srcdir/q-e-qe-${pkgver}MaX-Release" "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --enable-openmp \
              --with-libxc \
              --with-elpa-version=2019 \
              --with-elpa-include=/usr/include/elpa_openmp-$_elpaver/modules \
              --with-elpa-lib="-lelpa_openmp" \
              BLAS_LIBS='-lblas' \
              LAPACK_LIBS='-llapack' \
              SCALAPACK_LIBS='-lscalapack' \
              FFT_LIBS='-lfftw3 -lfftw3_threads'
  make all MANUAL_DFLAGS='-D__FFTW3' LD_LIBS='-lgomp'
  make -j1 epw MANUAL_DFLAGS='-D__FFTW3' LD_LIBS='-lgomp'
}

check() {
  cd "$srcdir/$pkgname-$pkgver/test-suite"
  rm pw_pawatom/paw-vcbfgs.in pw_relax/relax-extfor.in
  make run-tests-pw-serial OMP_NUM_THREADS=4
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
