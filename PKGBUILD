# Maintainer: "Jan Kohnert <bughunter@jan-kohnert.de"
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=eccodes
pkgver=2.22.0
_attnum=45757960
pkgrel=1
pkgdesc="ECMWF decoding library for GRIB, BUFR and GTS"
arch=('i686' 'x86_64')
url="https://software.ecmwf.int/wiki/display/ECC/ecCodes+Home"
license=('Apache')
depends=('openjpeg2' 'netcdf')
makedepends=('gcc-fortran' 'cmake')
conflicts=('grib_api' 'libbufr-ecmwf')
source=(http://software.ecmwf.int/wiki/download/attachments/${_attnum}/${pkgname}-${pkgver}-Source.tar.gz)
sha512sums=('488ff560cd9969c2d5c0dd0ce3e6b4433954893758ae1a2bd9177536d8b08a89f37aac4f6a175c271f528d5c838fd4ec7b090dfb1f691df5cfceb67508bdc470')

build() {
    cd "$srcdir"/${pkgname}-${pkgver}-Source
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production \
        -DCMAKE_INSTALL_DATAROOTDIR=/usr/share/$pkgname/definitions \
        -DCMAKE_INSTALL_DATADIR=/usr/share -DENABLE_AEC=ON \
        -DENABLE_PNG=ON -DENABLE_ECCODES_THREADS=ON -DENABLE_JPG=ON \
        -DENABLE_JPG_LIBOPENJPEG=ON -DENABLE_JPG_LIBJASPER=OFF ..
    make
}

check() {
    cd "$srcdir"/${pkgname}-${pkgver}-Source/build
    make test
}

package() {
    cd "$srcdir"/${pkgname}-${pkgver}-Source/build
    make DESTDIR="$pkgdir" install
}
