# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_basename=fftw
pkgname=fftw2
pkgver=2.1.5
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT), major version 2, with OpenMPI"
arch=("i686" "x86_64")
license=("GPL2")
url="http://www.fftw.org/"
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=("glibc")
makedepends=("gcc-fortran" "openmpi")
options=("libtool" "staticlibs")
source=("http://www.fftw.org/${_basename}-${pkgver}.tar.gz")
sha1sums=('12020b58edc1b0490a83db4aa912fac5dfdfb26b')
install=fftw2.install

# notes:
# http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
# http://www.fftw.org/faq/section2.html#singleprec
# http://www.fftw.org/fftw3_doc/Precision.html#Precision

build() {
  cd ${srcdir}

  # Don"t want to switch all the variable names in the PKGBUILD.
  mv ${_basename}-${pkgver} ${pkgname}-${pkgver}
  
  cp -a ${pkgname}-${pkgver} ${pkgname}-${pkgver}-double
  mv ${pkgname}-${pkgver} ${pkgname}-${pkgver}-single

  # use upstream default CFLAGS while keeping our -march/-mtune
  CFLAGS+=" -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

  CONFIGURE="./configure \
                 F77=gfortran \
                 --with-gcc \
                 --prefix=/usr \
                 --infodir=/usr/share/info \
                 --enable-type-prefix \
                 --enable-shared \
                 --enable-threads \
                 --enable-openmp \
                 --enable-mpi"

  # double precision
  cd ${srcdir}/${pkgname}-${pkgver}-double
  ${CONFIGURE}
  make

  # single precision
  cd ${srcdir}/${pkgname}-${pkgver}-single
  ${CONFIGURE} --enable-float
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}-double
  make check

  cd ${srcdir}/${pkgname}-${pkgver}-single
  make check  
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-double
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/${pkgname}-${pkgver}-single
  make DESTDIR=${pkgdir} install  
}
