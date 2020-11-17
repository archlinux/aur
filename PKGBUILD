# Maintainer: simon chou <sentientcatgmaildotcom>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=eccodes-git
pkgver=2020.10.1.r0.g929aee77
pkgrel=1
pkgdesc="ECMWF decoding library for GRIB, BUFR and GTS"
arch=('x86_64')
#url="https://software.ecmwf.int/wiki/display/ECC/ecCodes+Home"
url="https://github.com/ecmwf/eccodes"
license=('Apache')
depends=('openjpeg' 'libpng' 'python3' 'netcdf')
optdepends=('libaec: for compression' 'jasper: as an alternative to openjpeg')
makedepends=('gcc-fortran' 'python' 'python-numpy' 'cmake')
conflicts=('grib_api' 'libbufr-ecmwf')
#source=(http://software.ecmwf.int/wiki/download/attachments/${_attnum}/${pkgname}-${pkgver}-Source.tar.gz)
#source=(https://github.com/ecmwf/${pkgname}/archive/${pkgver}.tar.gz)
source=("eccodes::git+$url#branch=master")
md5sums=('SKIP')
#md5sums=('36a8c822e9a5eb0d70790354ae7fdd12')
#md5sums=('215860f56dc1599883624fc1f4acab15')
pkgver() {
				  cd "${pkgname%-git}"
          git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
		}
build() {
	cd $srcdir
	rm -rf ecbuild
	git clone https://github.com/ecmwf/ecbuild.git
  cd "$srcdir"/${pkgname%-git}
  sed -i 's/image.inmem_.*=.*1;//' src/grib_jasper_encoding.c
  mkdir -p build
  cd build
  [ -x /usr/bin/aec ] && has_aec=1 || has_aec=0
  cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATAROOTDIR=/usr/share/$pkgname/definitions \
    -DCMAKE_INSTALL_DATADIR=/usr/share -DENABLE_AEC=$has_aec \
    -DENABLE_PNG=1 -DENABLE_ECCODES_THREADS=1 \
    -DOPENJPEG_INCLUDE_DIR=`pkg-config --variable=includedir libopenjpeg` \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 ..
  make || return 1
}

package() {
  cd "$srcdir"/${pkgname%-git}/build
  make DESTDIR="$pkgdir" install || return 1
}
