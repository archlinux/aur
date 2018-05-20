# Maintainer: XavierCLL <xavier.corredor.llano gmail.com>
# Contributor: Luigi Ranghetti <luigi.ranghetti gmail.com>

pkgname=hdf4-nonetcdf
pkgver=4.2.13
pkgrel=2
pkgdesc="General purpose library and file format for storing scientific data. (NetCDF disabled)"
arch=('i686' 'x86_64')
url="http://www.hdfgroup.org/hdf4.html"
license=('custom')
depends=('bash' 'zlib' 'libjpeg-turbo' 'libtirpc')
makedepends=('gcc-libs' 'gcc-fortran' 'flex' 'bison')
options=('!libtool')
provides=('hdf4')
conflicts=('hdf4')
source=(http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-${pkgver}.tar.gz
        "config.patch")
md5sums=('a6aa950b3fce5162b96496d8ea0b82bf'
         'e16254cdd55c1a2653b31ec1bdc4b711')

prepare() {
  cd "${srcdir}/hdf-${pkgver}"
  patch < "${srcdir}/config.patch"
  autoreconf -i
}

build() {
  cd hdf-${pkgver}
  export CFLAGS=$CFLAGS" -fPIC"
  
  ./configure \
    CFLAGS="${CFLAGS} -fPIC" \
    LDFLAGS="-l:libjpeg.so.8 ${LDFLAGS}" \
    F77=gfortran \
    --prefix=/usr \
    --disable-netcdf \
    --enable-shared \
    --disable-fortran
  make
}

package() {
  cd hdf-${pkgver}
  make DESTDIR=${pkgdir}/ install
  
  # rename files that conflict with netcdf package
  mv ${pkgdir}/usr/bin/ncdump ${pkgdir}/usr/bin/hdf4_ncdump
  mv ${pkgdir}/usr/bin/ncgen ${pkgdir}/usr/bin/hdf4_ncgen
  mv ${pkgdir}/usr/share/man/man1/ncdump.1 ${pkgdir}/usr/share/man/man1/hdf4_ncdump.1
  mv ${pkgdir}/usr/share/man/man1/ncgen.1 ${pkgdir}/usr/share/man/man1/hdf4_ncgen.1
  
  rm -rf ${pkgdir}/usr/examples
  
  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
  cp COPYING ${pkgdir}/usr/share/licenses/$pkgname
}
