# Maintainer: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=5.22.0
pkgrel=4
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
url="http://map.project-osrm.org/"
depends=("expat" "boost-libs" "lua52" "intel-tbb")
makedepends=("cmake" "boost")
arch=('x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Project-OSRM/osrm-backend/archive/v$pkgver.tar.gz"
        "fix-boost-fs.patch"
        "fix-guidance-so.patch")
sha256sums=("df0987a04bcf65d74f9c4e18f34a01982bf3bb97aa47f9d86cfb8b35f17a6a55"
            "2c353e7e942df92091cf138f9c47135a74dc6f70bcad6897b118b312ca226ad6"
            "5866c256dcfd63806d696483e2b9ca9b74edb969697ba4ac3025948c892c1407")

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/fix-boost-fs.patch"
    patch --forward --strip=1 --input="${srcdir}/fix-guidance-so.patch"
}

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS="-Wno-pessimizing-move -Wno-redundant-move" \
        -DBUILD_SHARED_LIBS=ON
    make VERBOSE=1
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    cd build
    make DESTDIR="${pkgdir}/" install
}
