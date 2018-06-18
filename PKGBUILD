# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: Denis Gagnon <gagnon88 at gm41l dot com>

pkgname=fftw-mpi
pkgver=3.3.8
pkgrel=1
pkgdesc="FFTW, compiled with MPI and OpenMP support: header files, static and shared libraries"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.fftw.org/"
depends=('glibc' 'bash' 'openmpi')
conflicts=('fftw')
makedepends=('gcc-fortran')
source=("http://www.fftw.org/fftw-${pkgver}.tar.gz")
provides=('fftw')
options=('staticlibs')
install=fftw.install
sha1sums=('59831bd4b2705381ee395e54aa6e0069b10c3626')

# notes:
# http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
# http://www.fftw.org/faq/section2.html#singleprec
# http://www.fftw.org/fftw3_doc/Precision.html#Precision


build() {
  cd ${srcdir}
  
  cp -a fftw-${pkgver} fftw-${pkgver}-double
  cp -a fftw-${pkgver} fftw-${pkgver}-long-double
  mv fftw-${pkgver} fftw-${pkgver}-single
  

  # use upstream default CFLAGS while keeping our -march/-mtune
  CFLAGS+=" -O3 -fPIC -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

  CONFIGURE="./configure F77=gfortran --prefix=/usr \
                 --enable-shared --enable-threads --enable-mpi --enable-openmp"

  # build double precision
  cd ${srcdir}/fftw-${pkgver}-double
  $CONFIGURE --enable-sse2 --enable-avx
  make

  # build & install long double precission
  cd ${srcdir}/fftw-${pkgver}-long-double
  $CONFIGURE --enable-long-double
  make

  # build & install single precision
  cd ${srcdir}/fftw-${pkgver}-single
  $CONFIGURE --enable-float --enable-sse --enable-avx
  make
}

package() {
  cd ${srcdir}/fftw-${pkgver}-double
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/fftw-${pkgver}-long-double
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/fftw-${pkgver}-single
  make DESTDIR=${pkgdir} install  
}
