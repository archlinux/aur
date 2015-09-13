# Maintainer: Jean-Francis Roy <jeanfrancisroy _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>
pkgname=openblas-git
_pkgname=OpenBLAS
pkgver=0.2.9.rc1.r679.ga96a4cb
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD "
arch=('i686' 'x86_64')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran' 'git')
provides=('blas=3.5.0' 'openblas')
conflicts=('blas' 'openblas')
options=(!makeflags !emptydirs)
source=($_pkgname::git+https://github.com/xianyi/OpenBLAS.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  unset CFLAGS
  unset CXXFLAGS
  NPROC=`grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=`grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC
  make USE_OPENMP=1 NO_LAPACK=1 NUM_THREADS=$NCORE LIBPREFIX=libblas \
    MAJOR_VERSION=3 NO_CBLAS=1 NO_AFFINITY=1
}

package() {
  cd "$srcdir/$_pkgname"

  NPROC=`grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=` grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC
  make PREFIX="$pkgdir/usr" NUM_THREADS=$NCORE LIBPREFIX=libblas \
    MAJOR_VERSION=3 install
  rm -f "$pkgdir/usr/include/cblas.h" "$pkgdir"/usr/include/lapacke*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir/usr/lib/"
  ln -sf libblas_*-r$pkgver.a libblas.a
  ln -sf libblas_*-r$pkgver.so libblas.so
  ln -sf libblas_*-r$pkgver.so libblas.so.3
  sed -i -e "s%$pkgdir%%" "$pkgdir/usr/lib/cmake/openblas/OpenBLASConfig.cmake"
}

# vim:set ts=2 sw=2 et:
