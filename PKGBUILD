# Maintainer: "Jan Kohnert <bughunter@jan-kohnert.de"
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=eccodes
pkgver=2.24.0
_attnum=45757960
pkgrel=1
pkgdesc="ECMWF decoding library for GRIB, BUFR and GTS"
arch=("i686" "x86_64")
url="https://software.ecmwf.int/wiki/display/ECC/ecCodes+Home"
license=("Apache")
depends=("openjpeg2" "netcdf")
makedepends=("gcc-fortran" "cmake")
conflicts=("grib_api" "libbufr-ecmwf")
source=(
    "${pkgname}-${pkgver}-Source.tar.gz::https://confluence.ecmwf.int/download/attachments/${_attnum}/${pkgname}-${pkgver}-Source.tar.gz?api=v2"
    "http://download.ecmwf.org/test-data/eccodes/eccodes_test_data.tar.gz"
)
sha512sums=(
    "cfd1989ff6d733c3053dae75d1951d6ba475dd6a388b6d747c3a87ade3de9a77da8a6954b6a6ea2eb8cfbd3e08aad7a8b12db1561893f8acc2a9041ce7718e24"
    "553eb69f3664c2f847c5ee7a84066e814ef03b3148ae2c13d845891038336daca815673650f1d06efee4f4a1ddaa4326f2ddfbe81d29382e3f25608b249b8d9e"
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
