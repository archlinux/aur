# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Scott Tincman <sctincman at gmail dot com>

pkgname=octopus
pkgver=9.2
pkgrel=2
pkgdesc="Real-space Time-Dependent Density Functional Theory code"
arch=('x86_64')
url="https://octopus-code.org"
license=('LGPL')
depends=('elpa' 'gd' 'gsl' 'libxc' 'libvdwxc' 'perl')
makedepends=('gcc-fortran')
checkdepends=('procps-ng')
source=("https://gitlab.com/octopus-code/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('20bed6d1450205373e1500a38110d911bca4f38aa154c26ed877821d9eae0d1e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -if
  export _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
  export OPTFLAGS="-O2 -march=native"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
              --prefix=/usr \
              --enable-mpi \
              --enable-vectors \
              --with-scalapack="-lscalapack" \
              --with-blacs="-lscalapack" \
              --with-elpa-prefix=/usr \
              FCFLAGS_ELPA="-I/usr/include/elpa_openmp-$_elpaver/modules" \
              LIBS_ELPA="-lelpa_openmp" \
              CFLAGS="$OPTFLAGS" \
              CXXFLAGS="$OPTFLAGS" \
              FCFLAGS="$OPTFLAGS -fallow-argument-mismatch -fallow-invalid-boz"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  for t in testsuite/photo_electron/*.test
  do
    sed -i "s/Yes/No/g" $t
  done
  sed -i "s/Yes/No/g" testsuite/finite_systems_3d/14-fullerene_unpacked.test
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
