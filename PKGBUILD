# Maintainer: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>
pkgname=opencblas
_pkgname=OpenBLAS
pkgver=0.3.5
pkgrel=1
pkgdesc="An optimized CBLAS library based on GotoBLAS2 1.13 BSD "
arch=('i686' 'x86_64')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl')
provides=('cblas=3.8.0')
conflicts=('cblas')
options=(!makeflags !emptydirs)
source=(${_pkgname}-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz)
md5sums=('579bda57f68ea6e9074bf5780e8620bb')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  unset CFLAGS
  unset CXXFLAGS
  NPROC=`/usr/bin/grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=`/usr/bin/grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC
  make USE_OPENMP=1 NO_LAPACK=1 NUM_THREADS=$NCORE LIBPREFIX=libcblas \
    MAJOR_VERSION=3 ONLY_CBLAS=1 NO_AFFINITY=1 libs shared
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  NPROC=`/usr/bin/grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=`/usr/bin/grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC
  make PREFIX="$pkgdir/usr" NUM_THREADS=$NCORE LIBPREFIX=libcblas \
    MAJOR_VERSION=3 install
  rm -f "$pkgdir"/usr/include/lapacke* "$pkgdir"/usr/include/f77blas.h
  mv "$pkgdir"/usr/include/openblas_config.h "$pkgdir"/usr/include/opencblas_config.h
  sed -i -e 's/openblas_config/opencblas_config/' "$pkgdir"/usr/include/cblas.h
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir/usr/lib/"
  ln -sf libcblas_*-r$pkgver.a libcblas.a
  ln -sf libcblas_*-r$pkgver.so libcblas.so
  ln -sf libcblas_*-r$pkgver.so libcblas.so.3
  mv "$pkgdir/usr/lib/cmake/openblas" "$pkgdir/usr/lib/cmake/opencblas"
  mv "$pkgdir/usr/lib/cmake/opencblas/OpenBLASConfig.cmake" "$pkgdir/usr/lib/cmake/opencblas/OpenCBLASConfig.cmake"
  sed -i -e "s%$pkgdir%%" "$pkgdir/usr/lib/cmake/opencblas/OpenCBLASConfig.cmake"
  sed -i -e "s/OpenBLAS_/OpenCBLAS_/" "$pkgdir/usr/lib/cmake/opencblas/OpenCBLASConfig.cmake"
  mv "$pkgdir/usr/lib/pkgconfig/openblas.pc" "$pkgdir/usr/lib/pkgconfig/opencblas.pc"
  sed -i -e "s%$pkgdir%%" "$pkgdir/usr/lib/pkgconfig/opencblas.pc"
  sed -i -e "s/openblas/opencblas/" "$pkgdir/usr/lib/pkgconfig/opencblas.pc"
}

# vim:set ts=2 sw=2 et:
