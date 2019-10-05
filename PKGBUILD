# Maintainer : George Eleftheriou <eleftg>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgname=openblas-lapack-static
_PkgName=OpenBLAS
_pkgname=openblas
pkgver=0.3.7
# grep VERSION "${srcdir}/${_PkgName}-${pkgver}"/lapack-netlib/README.md | tail -n 1 | cut -d ' ' -f 2
_lapackver=3.8.0
pkgrel=1
pkgdesc="Optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, and cblas)"
arch=('x86_64')
url="https://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran')
provides=('openblas-lapack' 'openblas' "blas=${_lapackver}" "lapack=${_lapackver}" "cblas=${_lapackver}" "lapacke=${_lapackver}")
conflicts=('openblas-lapack' 'openblas' 'blas' 'lapack' 'cblas' 'lapacke')
options=('!emptydirs' 'staticlibs')
source=(${_PkgName}-v${pkgver}.tar.gz::https://github.com/xianyi/${_PkgName}/archive/v${pkgver}.tar.gz)
sha256sums=('bde136122cef3dd6efe2de1c6f65c10955bbb0cc01a520c2342f5287c28f9379')

build(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make FC=gfortran NO_LAPACK=0 BUILD_LAPACK_DEPRECATED=1 USE_OPENMP=0 \
      USE_THREAD=1 USE_COMPILER_TLS=0 MAKE_NB_JOBS=$(nproc) \
      libs netlib shared
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
  ln -sf libopenblas.a libblas.a
  ln -sf libopenblas.so libblas.so
  ln -sf libopenblas.so libblas.so.${_lapackver:0:1}
  ln -sf libopenblas.so libblas.so.${_lapackver}
  # CBLAS
  ln -sf libopenblas.a libcblas.a
  ln -sf libopenblas.so libcblas.so
  ln -sf libopenblas.so libcblas.so.${_lapackver:0:1}
  ln -sf libopenblas.so libcblas.so.${_lapackver}
  # LAPACK
  ln -sf libopenblas.a liblapack.a
  ln -sf libopenblas.so liblapack.so
  ln -sf libopenblas.so liblapack.so.${_lapackver:0:1}
  ln -sf libopenblas.so liblapack.so.${_lapackver}
  # LAPACKE
  ln -sf libopenblas.a liblapacke.a
  ln -sf libopenblas.so liblapacke.so
  ln -sf libopenblas.so liblapacke.so.${_lapackver:0:1}
  ln -sf libopenblas.so liblapacke.so.${_lapackver}
}
