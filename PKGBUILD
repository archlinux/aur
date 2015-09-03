# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=fftw-mpich
_pkgname=fftw
pkgver=3.3.4
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.fftw.org/"
depends=('bash' 'gcc-libs' 'mpich')
makedepends=('gcc-fortran')
provides=('fftw')
conflicts=('fftw')
source=("http://www.fftw.org/${_pkgname}-${pkgver}.tar.gz")
install=fftw.install
sha1sums=('fd508bac8ac13b3a46152c54b7ac885b69734262')

# notes:
# http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
# http://www.fftw.org/faq/section2.html#singleprec
# http://www.fftw.org/fftw3_doc/Precision.html#Precision


build() {
  cd ${srcdir}
  
  cp -a ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-double
  cp -a ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-long-double
  mv ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-single
  

  # use upstream default CFLAGS while keeping our -march/-mtune
  CFLAGS+=" -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

  CONFIGURE="./configure F77=gfortran --prefix=/usr \
                 --enable-shared --enable-threads \
		 --enable-openmp
                 --enable-mpi MPICC=/opt/mpich/bin/mpicc"

  # build double precision
  cd ${srcdir}/${_pkgname}-${pkgver}-double
  $CONFIGURE --enable-sse2 --enable-avx
  make

  # build & install long double precission
  cd ${srcdir}/${_pkgname}-${pkgver}-long-double
  $CONFIGURE --enable-long-double
  make

  # build & install single precision
  cd ${srcdir}/${_pkgname}-${pkgver}-single
  $CONFIGURE --enable-float --enable-sse --enable-avx
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}-double
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/${_pkgname}-${pkgver}-long-double
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/${_pkgname}-${pkgver}-single
  make DESTDIR=${pkgdir} install  
}
