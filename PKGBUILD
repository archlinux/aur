# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>

pkgname=grib_api
pkgver=1.14.0
_attnum=3473437
pkgrel=1
pkgdesc="A program interface for encoding and decoding GRIB messages"
arch=('i686' 'x86_64')
url="https://software.ecmwf.int/wiki/display/GRIB/Home"
license=('LGPL3' 'GPL3')
depends=('openjpeg' 'libpng' 'python2' 'netcdf')
optdepends=('libaec' 'jasper')
makedepends=('gcc-fortran' 'python2' 'python2-numpy')
provides=('grib_api')
replaces=('grib_api' 'grib_def')
conflicts=('grib_def')
source=(http://software.ecmwf.int/wiki/download/attachments/${_attnum}/${pkgname}-${pkgver}-Source.tar.gz)
md5sums=('afcfc0a465ce93d9418aea4e99523eb5')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}-Source
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATAROOTDIR=/usr/share/$pkgname/definitions \
    -DCMAKE_INSTALL_DATADIR=/usr/share -DENABLE_AEC=1 -DENABLE_PNG=1 \
    -DENABLE_GRIB_THREADS=1 \
    -DOPENJPEG_INCLUDE_DIR=`pkg-config --variable=includedir libopenjpeg` \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 ..
  make || return 1
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}-Source/build
  make DESTDIR="$pkgdir" install || return 1
}
