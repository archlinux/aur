# Maintainer: physkets <physkets@tutanota.com>
# Contributor: James Clark <s1127853@sms.ed.ac.uk>
pkgname=opencoarrays
pkgver=2.1.0
pkgrel=2
pkgdesc="A transport layer for coarray Fortran compilers."
url="http://www.opencoarrays.org/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('mpich' 'gcc-fortran')
makedepends=('cmake')
source=("https://github.com/sourceryinstitute/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c8e4ce7ddb851fd3eb981836c9e2e1a5de53afe3da1401971cfaf4114edb3af7')

build() {
  export PATH="/opt/mpich/bin:$PATH"
  cd "${srcdir}/OpenCoarrays-${pkgver}"
  mkdir -p build
  cd build
  CC=gcc FC=gfortran cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMPI_C_COMPILER=mpicc \
    -DMPI_Fortran_COMPILER=mpifort

  make
}

check() {
  export PATH="/opt/mpich/bin:$PATH"
  cd "${srcdir}/OpenCoarrays-${pkgver}/build"
  ctest
}

package() {
  cd "${srcdir}/OpenCoarrays-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
