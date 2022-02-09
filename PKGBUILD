# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='stack-of-tasks'
pkgname=eigenpy
pkgver=2.6.10
pkgrel=3
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('1ec1e166db0dddb8175d86c94697a41b387adf1c3a137827ff6ac35db6149880'
            'SKIP')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD' 'F182CC432A4752C7A3E4FE02001EB2069D785C81')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    sed -i '/Boost COMPONENTS python3/d' "$pkgdir/usr/lib/cmake/eigenpy/eigenpyConfig.cmake"
}
