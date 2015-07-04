# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>

pkgname=grib_api
pkgver=1.13.1
_attnum=3473437
pkgrel=1
pkgdesc="A program interface for encoding and decoding GRIB messages"
arch=('i686' 'x86_64')
url="https://software.ecmwf.int/wiki/display/GRIB/Home"
license=('LGPL3' 'GPL3')
#
# Note: the default is to compile against openjpeg, and this library is
#       preferred upstream on jasper library. To compile with jasper,
#       comment the following line and uncomment the below one to drop
#       openjpeg dependency. IF both openjpeg and jasper are installed
#       and you want to compile against jasper, uncomment the line
#       below to patch configure to prefer jasper over openjpeg
#
depends=('openjpeg' 'libpng' 'python2' 'netcdf')
# depends=('jasper' 'libpng' 'python2')
makedepends=('gcc-fortran' 'python2' 'python2-numpy')
provides=('grib_api')
replaces=('grib_api' 'grib_def')
conflicts=('grib_def')
source=(http://software.ecmwf.int/wiki/download/attachments/${_attnum}/${pkgname}-${pkgver}.tar.gz configure.patch)
md5sums=('2d76933cd11ed33ff4141717a8761070'
         'bd0e0fe50e6ae8ffee0bdfeeecd300f4')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i configure -e 's|share/samples|share/grib_api/samples|'
  # Uncomment to build with jasper if BOTH jasper and openjpeg are installed
  # patch -p0 -i $srcdir/configure.patch
  sed -i configure -e 's|python python2|python2 python|'
  sed -i src/grib_openjpeg_encoding.c \
    -e 's!"openjpeg\.h"!<openjpeg-1.5/openjpeg\.h>!'
  ./configure F77="gfortran" FC="gfortran" CPPFLAGS="$CPPFLAGS -fPIC" \
     --prefix=/usr --enable-python --with-png-support \
     --with-netcdf=/usr --with-jasper=/usr \
     --datadir=/usr/share/ \
     --datarootdir=/usr/share/$pkgname/definitions || return 1
  sed -i  ifs_samples/grib1/Makefile \
    -e 's|/usr/ifs_samples/grib1|/usr/share/grib_api/ifs_samples/grib1|'
  sed -i  ifs_samples/grib1_mlgrib2/Makefile \
 -e 's|/usr/ifs_samples/grib1_mlgrib2|/usr/share/grib_api/ifs_samples/grib1_mlgrib2|'
  sed -i  ifs_samples/grib1_mlgrib2_ieee64/Makefile \
 -e 's|/usr/ifs_samples/grib1_mlgrib2_ieee64|/usr/share/grib_api/ifs_samples/grib1_mlgrib2_ieee64|'
  sed -i tools/grib1to2.txt -e 's|/bin/ksh|/bin/bash|'
  make || return 1
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install || return 1
  mv $pkgdir/usr/bin/points $pkgdir/usr/bin/grib_points
}
