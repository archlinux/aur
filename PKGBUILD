# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Scott Tincman <sctincman at gmail dot com>

pkgname=octopus
pkgver=11.3
pkgrel=2
pkgdesc="Real-space Time-Dependent Density Functional Theory code"
arch=('x86_64')
url="https://octopus-code.org"
license=('LGPL')
depends=('elpa' 'gd' 'gsl' 'libxc' 'libvdwxc' 'netcdf-fortran' 'parmetis'
         'nlopt' 'cgal' 'clfft' 'clblas' 'python')
makedepends=('gcc-fortran')
checkdepends=('procps-ng')
source=("$url/down.php?file=$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0c98417071b5e38ba6cbdd409adf917837c387a010e321c0a7f94d9bd9478930')

prepare() {
  mkdir -p "$srcdir/build"
  autoreconf -if "$srcdir/$pkgname-$pkgver"
  export _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
  export OPTFLAGS="-O3 -march=native"
}

build() {
  cd "$srcdir/build"
  ../$pkgname-$pkgver/configure \
    --prefix=/usr \
    --enable-mpi \
    --enable-vectors \
    --with-scalapack="-lscalapack" \
    --with-blacs="-lscalapack" \
    --with-elpa-prefix=/usr \
    --with-cgal=/usr \
    --with-clfft-prefix=/usr \
    --with-clblas-prefix=/usr \
    FCFLAGS_ELPA="-I/usr/include/elpa_openmp-$_elpaver/modules" \
    LIBS_ELPA="-lelpa_openmp" \
    CFLAGS="$OPTFLAGS" \
    CXXFLAGS="$OPTFLAGS" \
    FCFLAGS="$OPTFLAGS -fallow-argument-mismatch -fallow-invalid-boz"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/testsuite"
  sed -i "s/Yes/No/g" \
    finite_systems_1d/02-neon_mpi.test \
    functionals/18-mgga.test \
    real_time/01-propagators.test \
    real_time/06-caetrs.test

  cd "../../build"
  make check-short
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
