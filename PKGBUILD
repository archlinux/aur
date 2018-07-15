# Maintainer: Steven Vancoillie <steven<dot>vancoillie[at]gmail[dot]com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgname=openblas-lapack-ilp64
_pkgname=OpenBLAS
pkgver=0.2.20
pkgrel=1
pkgdesc="Optimized BLAS library based on GotoBLAS2 (dynamic arch)"
arch=('x86_64')
url="http://xianyi.github.com/OpenBLAS/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran')
options=(staticlibs)
source=(${_pkgname}-v${pkgver}.tar.gz::https://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz)
sha256sums=('73c40ace5978282224e5e122a41c8388c5a19e65a6f2329c2b7c0b61bacc9044')

_config="USE_OPENMP=1 NO_LAPACK=0 INTERFACE64=1 BINARY=64 DYNAMIC_ARCH=1"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  NPROC=`grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=`grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC

  make ${_config} NUM_THREADS=$NCORE libs netlib shared

}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make ${_config} tests
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/opt/${pkgname}" install

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove reference to ${pkgdir}
  sed -i -e "s%${pkgdir}%%" "${pkgdir}/opt/${pkgname}/lib/cmake/openblas/OpenBLASConfig.cmake"
}

# vim:set ts=2 sw=2 et:
