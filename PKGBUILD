# Maintainer: Jean-Francis Roy <jeanfrancisroy _AT_ gmail _DOT_ com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>
pkgname=openblas-lapack-git
_pkgname=OpenBLAS
pkgver=0.2.9.rc1.r679.ga96a4cb
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack and cblas)"
arch=('i686' 'x86_64')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran' 'git')
provides=('openblas-lapack' 'openblas' 'blas=3.5.0' 'lapack=3.5.0' 'cblas')
conflicts=('blas' 'openblas' 'lapack' 'cblas')
options=(!makeflags !emptydirs)
source=($_pkgname::git+https://github.com/xianyi/OpenBLAS.git)
md5sums=('SKIP')

_config="FC=gfortran USE_OPENMP=0 USE_THREAD=1 MAJOR_VERSION=3 NO_LAPACK=0"

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
  make ${_config} NUM_THREADS=${NCORE} libs netlib shared
}

package() {
  cd "$srcdir/$_pkgname"

  NPROC=`grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=` grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC
  make ${_config} PREFIX=/usr DESTDIR="${pkgdir}" NUM_THREADS=$NCORE install

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
