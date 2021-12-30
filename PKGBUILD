# Maintainer: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>
pkgname=opencblas
_pkgname=OpenBLAS
pkgver=0.3.19
pkgrel=1
pkgdesc="An optimized CBLAS library based on GotoBLAS2 1.13 BSD "
arch=('i686' 'x86_64')
url="https://github.com/xianyi/OpenBLAS"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl')
provides=('cblas=3.9.0')
conflicts=('cblas')
options=(!makeflags !emptydirs !staticlibs)
source=($url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('1fcbcfefb7744894b0b0c83c6071b342086ca311dc67f5c2745812d61dcc9d31ef7dd5e1215dfb2731ae7197d497dbdf8f8b26a432eb07d41a7db0983eb86a33')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  unset CFLAGS
  unset CXXFLAGS
  make NO_STATIC=1 NO_LAPACK=1 NO_LAPACKE=1 ONLY_CBLAS=1 NO_AFFINITY=1 \
       USE_OPENMP=1 TARGET=CORE2 DYNAMIC_ARCH=1 LIBPREFIX=libcblas \
       NUM_THREADS=64 MAJOR_VERSION=3 libs shared
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" NUM_THREADS=64 LIBPREFIX=libcblas \
    MAJOR_VERSION=3 install
  rm -f "$pkgdir"/usr/include/lapack* "$pkgdir"/usr/include/f77blas.h
  mv "$pkgdir"/usr/include/openblas_config.h "$pkgdir"/usr/include/opencblas_config.h
  sed -i -e 's/openblas_config/opencblas_config/' "$pkgdir"/usr/include/cblas.h
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir/usr/lib/"
  mv "$pkgdir/usr/lib/cmake/openblas" "$pkgdir/usr/lib/cmake/opencblas"
  mv "$pkgdir/usr/lib/cmake/opencblas/OpenBLASConfig.cmake" "$pkgdir/usr/lib/cmake/opencblas/OpenCBLASConfig.cmake"
  mv "$pkgdir/usr/lib/cmake/opencblas/OpenBLASConfigVersion.cmake" "$pkgdir/usr/lib/cmake/opencblas/OpenCBLASConfigVersion.cmake"
  sed -i -e "s%$pkgdir%%" "$pkgdir/usr/lib/cmake/opencblas/OpenCBLASConfig.cmake"
  sed -i -e "s/OpenBLAS_/OpenCBLAS_/" "$pkgdir/usr/lib/cmake/opencblas/OpenCBLASConfig.cmake"
  mv "$pkgdir/usr/lib/pkgconfig/openblas.pc" "$pkgdir/usr/lib/pkgconfig/opencblas.pc"
  sed -i -e "s%$pkgdir%%" "$pkgdir/usr/lib/pkgconfig/opencblas.pc"
  sed -i -e "s/openblas/opencblas/" "$pkgdir/usr/lib/pkgconfig/opencblas.pc"
  sed -i -e "s/-lgfortran//g" "$pkgdir/usr/lib/pkgconfig/opencblas.pc"
  ln -s opencblas.pc "$pkgdir"/usr/lib/pkgconfig/cblas.pc
}

# vim:set ts=2 sw=2 et:
