# Maintainer: "Jan Kohnert <bughunter@jan-kohnert.de"
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=eccodes
pkgver=2.26.0
_attnum=45757960
pkgrel=2
pkgdesc="ECMWF decoding library for GRIB, BUFR and GTS"
arch=("i686" "x86_64")
url="https://confluence.ecmwf.int/display/ECC/ecCodes+Home"
license=("Apache")
depends=("openjpeg2" "netcdf")
makedepends=("gcc-fortran" "cmake")
conflicts=("grib_api" "libbufr-ecmwf")
source=(
    "${pkgname}-${pkgver}-Source.tar.gz::https://confluence.ecmwf.int/download/attachments/${_attnum}/${pkgname}-${pkgver}-Source.tar.gz?api=v2"
    "${pkgname}-${pkgver}-test-data.tar.gz::http://download.ecmwf.org/test-data/eccodes/eccodes_test_data.tar.gz"
)
sha512sums=(
    "cd4fd2048ad98a4a5c82a0a233b2e64eb67a195d42637607423669351b6cd295b111a382f6d9ecb05ffe25f79599bf3963550ca27d84e7f9ef55e499e183a35f"
    "0457878caad6a3395daf60e27cfb72121526065b0cf4da144c7499b8d38bebae0952ddbd20ef0eb53fad77ada60160039340da01001f19fbb7fb1ccbb3d0547a"
)
    
prepare() {
    mkdir -p "$srcdir"/${pkgname}-${pkgver}-Source/build
    mv data "$srcdir"/${pkgname}-${pkgver}-Source/build/
}

build() {
    cd "$srcdir"/${pkgname}-${pkgver}-Source
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=production -DCMAKE_INSTALL_DATADIR=/usr/share \
        -DCMAKE_INSTALL_DATAROOTDIR=/usr/share/$pkgname/definitions \
        -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_AEC=ON \
        -DENABLE_ECCODES_THREADS=ON -DENABLE_EXTRA_TESTS=ON -DENABLE_JPG=ON \
        -DENABLE_JPG_LIBJASPER=OFF -DENABLE_JPG_LIBOPENJPEG=ON -DENABLE_PNG=ON ..
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
