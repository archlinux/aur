# Maintainer : George Eleftheriou <eleftg>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=hdf4-java
_pkgname=hdf4
pkgver=2.13
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data (full version including the Java Native Interfaces - JNI)"
arch=('i686' 'x86_64')
url="http://www.hdfgroup.org/hdf4.html"
license=('custom')
depends=('zlib' 'libjpeg-turbo')
makedepends=('java-environment' 'gcc-fortran')
conflicts=('netcdf' 'hdf4')
provides=('hdf4')
source=(http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-4.2.13.tar.gz)
sha256sums=('be9813c1dc3712c2df977d4960e1f13f20f447dfa8c3ce53331d610c1f470483')

build() {
  cd "${srcdir}/hdf-4.2.13"

  ./configure \
    CFLAGS="${CFLAGS} -fPIC" \
    LDFLAGS="-l:libjpeg.so.8 ${LDFLAGS}" \
    F77=gfortran \
    --enable-fortran \
    --enable-production \
    --enable-java \
    --with-zlib \
    --prefix=/usr

  make
}

package() {
  cd "${srcdir}/hdf-4.2.13"
  make -j1 prefix="${pkgdir}/usr" install
  mv "${pkgdir}/usr/share" "${pkgdir}/usr/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  mv "${pkgdir}/usr/${_pkgname}" "${pkgdir}/usr/share/doc"
  mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
  cp "${srcdir}/hdf-4.2.13/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
