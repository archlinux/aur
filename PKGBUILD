# Maintainer: thrasibule <guillaume.horel@gmail.com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgname=openblas-lapack
_PkgName=OpenBLAS
_pkgname=openblas
pkgver=0.3.19
# grep VERSION "${srcdir}/${_PkgName}-${pkgver}"/lapack-netlib/README.md | tail -n 1 | cut -d ' ' -f 2
_lapackver=3.9.0
_blasver=3.8.0
pkgrel=2
pkgdesc="Optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, and cblas)"
arch=('x86_64')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran')
provides=('openblas' "blas=${_blasver}" "lapack=${_lapackver}" "cblas=${_blasver}" "lapacke=${_lapackver}")
conflicts=('openblas' 'blas' 'lapack' 'cblas' 'lapacke')
options=(!emptydirs)
source=(${_PkgName}-${pkgver}.tar.gz::https://github.com/xianyi/${_PkgName}/archive/v${pkgver}.tar.gz
  https://patch-diff.githubusercontent.com/raw/xianyi/OpenBLAS/pull/3504.patch)
sha256sums=('947f51bfe50c2a0749304fbe373e00e7637600b0a47b78a51382aeb30ca08562'
            '52a0ce2e8c7e3904cd1f2e65ab877d9370a6fcd23a1cd35e2e6a7ffa9fb4434c')

# Add the following line to the _config variable if you want to set the number of make jobs
#  MAKE_NB_JOBS=2 \
_config="FC=gfortran USE_OPENMP=1 USE_THREAD=1 \
  USE_TLS=1 \
  NO_LAPACK=0 BUILD_LAPACK_DEPRECATED=1 \
  MAJOR_VERSION=${_lapackver:0:1} NO_STATIC=1"

prepare(){
  cd "${_PkgName}-${pkgver}"
  patch -p1 -i ../3504.patch
}

build(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} CFLAGS="${CFLAGS}" libs netlib shared
}

check(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} tests
}

package(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} PREFIX=/usr DESTDIR="${pkgdir}" install

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Symlink to provide blas, cblas, lapack and lapacke
  cd "${pkgdir}/usr/lib/"
  # BLAS
  ln -sf libopenblas.so libblas.so
  ln -sf libopenblas.so libblas.so.${_blasver:0:1}
  ln -sf libopenblas.so libblas.so.${_blasver}
  # CBLAS
  ln -sf libopenblas.so libcblas.so
  ln -sf libopenblas.so libcblas.so.${_blasver:0:1}
  ln -sf libopenblas.so libcblas.so.${_blasver}
  # LAPACK
  ln -sf libopenblas.so liblapack.so
  ln -sf libopenblas.so liblapack.so.${_lapackver:0:1}
  ln -sf libopenblas.so liblapack.so.${_lapackver}
  # LAPACKE
  ln -sf libopenblas.so liblapacke.so
  ln -sf libopenblas.so liblapacke.so.${_lapackver:0:1}
  ln -sf libopenblas.so liblapacke.so.${_lapackver}
}
# vim:set ts=2 sw=2 et:
