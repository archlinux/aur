# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgname=openblas-lapack
_pkgname=OpenBLAS
pkgver=0.2.14
pkgrel=3
pkgdesc="Optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, and cblas)"
arch=('i686' 'x86_64')
url="http://xianyi.github.com/OpenBLAS/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran')
provides=('openblas' 'blas=3.5.0' 'lapack=3.5.0' 'cblas')
conflicts=('openblas' 'blas' 'lapack' 'cblas')
options=(!emptydirs)
source=(${_pkgname}-v${pkgver}.tar.gz::https://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz)
sha256sums=('2411c4f56f477b42dff54db2b7ffc0b7cf53bb9778d54982595c64cc69c40fc1')

_config="USE_OPENMP=0 USE_THREAD=1 MAJOR_VERSION=3 NO_LAPACK=0"

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

  make ${_config} PREFIX=/usr DESTDIR="${pkgdir}" install

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Symlink to provide blas, cblas and lapack
  cd "${pkgdir}/usr/lib/"
  # BLAS
  ln -sf libopenblas.so libblas.so
  ln -sf libopenblas.so libblas.so.3
  ln -sf libopenblas.so libblas.so.3.5.0
  # CBLAS
  ln -sf libopenblas.so libcblas.so
  # LAPACK
  ln -sf libopenblas.so liblapack.so
  ln -sf libopenblas.so liblapack.so.3
  ln -sf libopenblas.so liblapack.so.3.5.0
}

# vim:set ts=2 sw=2 et:
