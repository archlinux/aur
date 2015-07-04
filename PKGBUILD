pkgname=grads
pkgver=2.1.a3
pkgrel=1
pkgdesc="The Grid Analysis and Display System (GrADS) is an interactive \
desktop tool that is used for easy access, manipulation, and visualization \
of earth science data. The format of the data may be either binary, GRIB, \
NetCDF, or HDF-SDS (Scientific Data Sets)."
url="http://www.iges.org/grads"
license="GPL"
depends=(netcdf udunits cairo libdap jasper libgeotiff hdf4-nonetcdf)
makedepends=(shapelib g2clib gadap)
arch=(i686 x86_64)
provides=(grads)
conflicts=(grads)
source=(ftp://cola.gmu.edu/grads/2.1/${pkgname}-${pkgver}-src.tar.gz time_unit.patch)
md5sums=('57f097ddea5cb6189bbac511b52b12dd'
         '4267574ffb319dfef225a923fa7d6975')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p0 -i ${srcdir}/time_unit.patch
  sed -i configure.ac -e 's/png15/png16/g'
  sed -i acinclude.m4 \
    -e 's/${ga_lib_prefix}${ga_lib_name}${ga_lib_suffix}/-l${ga_lib_name}/'
  sed 's!/usr/local/lib/grads!/usr/share/grads!' -i src/gx.h
  sed 's!/usr/local/lib/grads!/usr/share/grads!' -i src/gxsubs.c
  autoreconf -f -i
  CFLAGS="$CFLAGS -Wno-trigraphs" \
  ./configure SUPPLIBS=/usr --prefix=/usr 
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make prefix=${pkgdir}/usr install
  mkdir -p ${pkgdir}/usr/share/grads
  cp -a data/* ${pkgdir}/usr/share/grads
}

# vim:set ts=2 sw=2 et:
