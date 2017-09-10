pkgname=grads
pkgver=2.2.0
pkgrel=1
pkgdesc="The Grid Analysis and Display System (GrADS) is an interactive \
desktop tool that is used for easy access, manipulation, and visualization \
of earth science data. The format of the data may be either binary, GRIB, \
NetCDF, or HDF-SDS (Scientific Data Sets)."
url="http://cola.gmu.edu/grads/grads.php"
license=("GPL")
depends=(netcdf udunits cairo libdap jasper libgeotiff hdf4-nonetcdf shapelib gd)
makedepends=(g2clib gadap)
arch=(i686 x86_64)
provides=(grads)
conflicts=(grads)
source=(ftp://cola.gmu.edu/grads/2.2/${pkgname}-${pkgver}-src.tar.gz time_unit.patch configure.ac.patch udpt)
md5sums=('9abad72ff5ea7204797696e582d88966'
         '8b6559bdff9605a1bfce506cd0315b57'
         '789224e91bda2e2b36fc5022854841d8'
         'efea7122a20000669392d55109839ddd')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p0 -i ${srcdir}/time_unit.patch
  patch -Rp0 -i ${srcdir}/configure.ac.patch
  echo "void gxdXflush(void) { }" > src/aflush.c
  sed -i configure.ac -e 's/png15/png16/g' -e 's/grib2c/g2c/g'
  sed -i acinclude.m4 \
    -e 's/${ga_lib_prefix}${ga_lib_name}${ga_lib_suffix}/-l${ga_lib_name}/'
  sed 's!/usr/local/lib/grads!/usr/share/grads!' -i src/gx.h
  sed 's!/usr/local/lib/grads!/usr/share/grads!' -i src/gxsubs.c
  autoreconf -f -i
  CFLAGS="$CFLAGS -Wno-trigraphs" \
  ./configure SUPPLIBS=/usr --prefix=/usr --libdir=/usr/lib/grads
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/share/grads
  cp -a data/* ${pkgdir}/usr/share/grads
  cp ${srcdir}/udpt ${pkgdir}/usr/share/grads
}

# vim:set ts=2 sw=2 et:
