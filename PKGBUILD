# Maintainer: Kev Moriarty <kev.moriarty@gmail.com>
pkgname=taucs
pkgver=2.2
pkgrel=1
pkgdesc="Solver for positive definite sparse matrix"
arch=('x86_64')
url="http://www.tau.ac.il/~stoledo/taucs/2.2/"
license=('custom')
depends=('gcc-libs' 'blas' 'lapack' 'metis')
makedepends=('gcc' 'gcc-fortran' 'make')
source=(${url}${pkgname}.tgz)
noextract=(${pkgname}.tgz)
options=('staticlibs')
md5sums=('ebb43f628c0d3c36873d8a4ec9a31888')

prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  mv ${pkgname}.tgz "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  tar xzf ${pkgname}.tgz
  cd ..
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  echo "FC = gfortran"                               >> config/linux.mk
  echo "FFLAGS = -O3 -fPIC"                          >> config/linux.mk
  echo "CFLAGS = -O3 -fPIC -pedantic -ansi -std=c11" >> config/linux.mk
  echo "LDFLAGS = -fPIC"                             >> config/linux.mk
  echo "LIBBLAS = -lblas"                            >> config/linux.mk
  echo "LIBLAPACK = -llapack"                        >> config/linux.mk
  echo "LIBMETIS = -lmetis"                          >> config/linux.mk
  echo "LIBF77 = -lgfortran"                         >> config/linux.mk
  ./configure
  make
  cd ..
}
package() {
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include/taucs/
  cd "$srcdir/$pkgname-$pkgver"
  cp lib/linux/*.a   $pkgdir/usr/lib/
  cp src/*           $pkgdir/usr/include/taucs/
  cp build/linux/*.h $pkgdir/usr/include/taucs/
  chmod 644 $pkgdir/usr/include/taucs/*
}
