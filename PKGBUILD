# Maintainer: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=5.23.0
pkgrel=1
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
url="http://map.project-osrm.org/"
depends=("expat" "boost-libs" "lua52" "intel-tbb")
# XXX: for now build with gcc 10 fails, so we have to stick with gcc 9 a little longer
# see https://github.com/Project-OSRM/osrm-backend/issues/5858
makedepends=("cmake" "boost" "gcc9")
arch=('x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Project-OSRM/osrm-backend/archive/v$pkgver.tar.gz")
sha256sums=("8527ce7d799123a9e9e99551936821cc0025baae6f2120dbf2fbc6332c709915")

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_COMPILER=g++-9 \
        -DCMAKE_C_COMPILER=gcc-9 \
        -DBUILD_SHARED_LIBS=ON
    make VERBOSE=1
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    cd build
    make DESTDIR="${pkgdir}/" install
}
