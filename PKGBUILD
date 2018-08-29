# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=fftw-static
_name=${pkgname%-static}
pkgver=3.3.8
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.fftw.org/"
depends=('bash' 'gcc-libs')
makedepends=('gcc-fortran')
source=("http://www.fftw.org/${_name}-${pkgver}.tar.gz")
sha1sums=('59831bd4b2705381ee395e54aa6e0069b10c3626')
options=('staticlibs')

# notes:
# http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
# http://www.fftw.org/faq/section2.html#singleprec
# http://www.fftw.org/fftw3_doc/Precision.html#Precision


build() {
  cd ${srcdir}
  
  cp -a ${_name}-${pkgver} ${_name}-${pkgver}-double
  cp -a ${_name}-${pkgver} ${_name}-${pkgver}-long-double
  mv ${_name}-${pkgver} ${_name}-${pkgver}-single
  

  # use upstream default CFLAGS while keeping our -march/-mtune
  CFLAGS+=" -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math -fPIC"

  CONFIGURE="./configure F77=gfortran --prefix=/opt/fftw-static \
                 --enable-threads --disable-doc"

  # build double precision
  cd ${srcdir}/${_name}-${pkgver}-double
  $CONFIGURE --enable-sse2 --enable-avx
  make

  # build & install long double precission
  cd ${srcdir}/${_name}-${pkgver}-long-double
  $CONFIGURE --enable-long-double
  make

  # build & install single precision
  cd ${srcdir}/${_name}-${pkgver}-single
  $CONFIGURE --enable-float --enable-sse --enable-avx
  make
}

package() {
  cd ${srcdir}/${_name}-${pkgver}-double
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/${_name}-${pkgver}-long-double
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/${_name}-${pkgver}-single
  make DESTDIR=${pkgdir} install  

  rm -r ${pkgdir}/opt/fftw-static/share/man
}
