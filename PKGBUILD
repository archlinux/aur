# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=hdf4-nonetcdf
pkgver=4.2.12
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data. (NetCDF disabled)"
arch=('i686' 'x86_64')
url="http://www.hdfgroup.org/hdf4.html"
license=('custom')
depends=('bash' 'libjpeg' 'zlib')
makedepends=('gcc-libs' 'gcc-fortran' 'flex' 'bison')
options=('!libtool')
provides=('hdf4')
conflicts=('hdf4')
#source=(http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-${pkgver}.tar.gz)
source=(http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-${pkgver}.tar.gz)
md5sums=('79fd1454c899c05e34a3da0456ab0c1c')

build() {
  cd ${srcdir}/hdf-${pkgver}
  
  export CFLAGS=$CFLAGS" -fPIC"
  ./configure --prefix=/usr F77=gfortran --disable-netcdf --enable-shared --disable-fortran
  make
}

package() {
  cd ${srcdir}/hdf-${pkgver}
  make DESTDIR=${pkgdir}/ install
  
  # rename files that conflict with netcdf package
  mv ${pkgdir}/usr/bin/ncdump ${pkgdir}/usr/bin/hdf4_ncdump
  mv ${pkgdir}/usr/bin/ncgen ${pkgdir}/usr/bin/hdf4_ncgen
  mv ${pkgdir}/usr/share/man/man1/ncdump.1 ${pkgdir}/usr/share/man/man1/hdf4_ncdump.1
  mv ${pkgdir}/usr/share/man/man1/ncgen.1 ${pkgdir}/usr/share/man/man1/hdf4_ncgen.1
  
  rm -rf ${pkgdir}/usr/examples
  
  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
  cp ${srcdir}/hdf-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/$pkgname
}
