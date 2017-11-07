# Maintainer: CUI Hao <cuihao.leo@gmail.com>

# based on PKGBUILD of extra/fftw
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=fftw-quad
_pkgname=fftw
pkgver=3.3.7
pkgrel=1
pkgdesc="FFTW Quad-precision (float128) version, a library for computing the discrete Fourier transform (DFT)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.fftw.org/"
depends=('bash' 'gcc-libs' 'fftw')
source=("http://www.fftw.org/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('2ae980a8d44c161ce4a09c6e2d1c79243ecbabb2')

build() {
  cd ${srcdir}

  # use upstream default CFLAGS while keeping our -march/-mtune
  CFLAGS+=" -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

  CONFIGURE="./configure --prefix=/usr \
                 --enable-shared --enable-threads \
		 --enable-openmp \
                 --disable-fortran --disable-doc"

  cd ${srcdir}/${_pkgname}-${pkgver}
  $CONFIGURE --enable-quad-precision
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install  

  rm ${pkgdir}/usr/include/fftw3*
  rmdir ${pkgdir}/usr/include/

  rm ${pkgdir}/usr/bin/fftw-wisdom-to-conf
  rm ${pkgdir}/usr/share/man/*/fftw-wisdom-to-conf*
}
