pkgname=grads
pkgver=2.2.1
pkgrel=2
pkgdesc="The Grid Analysis and Display System (GrADS) is an interactive \
desktop tool that is used for easy access, manipulation, and visualization \
of earth science data. The format of the data may be either binary, GRIB, \
NetCDF, or HDF-SDS (Scientific Data Sets)."
url="http://cola.gmu.edu/grads/grads.php"
license=("GPL")
depends=(netcdf udunits cairo libdap jasper libgeotiff hdf4 shapelib gd)
makedepends=(g2clib gadap)
arch=(i686 x86_64)
provides=(grads)
conflicts=(grads)
source=(ftp://cola.gmu.edu/grads/2.2/${pkgname}-${pkgver}-src.tar.gz time_unit.patch configure.ac.patch udpt cairo.m4 libshp.m4 libgadap.m4)
md5sums=('2c893cacef9d9b0fd869cb802fbf4b63'
         '8b6559bdff9605a1bfce506cd0315b57'
         '4ba162aefeb175eab82f5c0d64b58a40'
         'efea7122a20000669392d55109839ddd'
         'a2ef71af8cfbe2825edb681648d3f03e'
         'a551057b73cd63db89fb11bf5b5c96ab'
         '32423b1d5dd86526abf2913dd6a21ee9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p0 -i ${srcdir}/time_unit.patch
  patch -p0 -i ${srcdir}/configure.ac.patch
  cp ${srcdir}/*.m4 m4
  echo "void gxdXflush(void) { }" > src/aflush.c
  sed -i configure.ac -e 's/png15/png16/g' -e 's/grib2c/g2c/g'
  sed -i acinclude.m4 \
    -e 's/${ga_lib_prefix}${ga_lib_name}${ga_lib_suffix}/-l${ga_lib_name}/'
  sed 's!/usr/local/lib/grads!/usr/share/grads!' -i src/gx.h
  sed 's!/usr/local/lib/grads!/usr/share/grads!' -i src/gxsubs.c
  autoreconf -f -i
  CFLAGS="$CFLAGS -Wno-trigraphs" \
  ./configure --with-hdf4=/opt/hdf4 SUPPLIBS=/usr --prefix=/usr --libdir=/usr/lib/grads
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
