# Maintainer: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>
pkgname=openblas
_pkgname=OpenBLAS
pkgver=0.2.14
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD "
arch=('i686' 'x86_64')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran')
provides=('blas=3.5.0')
conflicts=('blas')
options=(!makeflags !emptydirs)
source=(${_pkgname}-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz)
md5sums=('53cda7f420e1ba0ea55de536b24c9701')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  unset CFLAGS
  unset CXXFLAGS
  NPROC=`grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=`grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC
  make USE_OPENMP=1 NO_LAPACK=1 NUM_THREADS=$NCORE LIBPREFIX=libblas \
    MAJOR_VERSION=3 NO_CBLAS=1 NO_AFFINITY=1
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

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
