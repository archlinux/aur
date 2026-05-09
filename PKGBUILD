# Maintainer: jonleithe
pkgname=unitfy
pkgver=1.0.3
pkgrel=1
pkgdesc="Command-line unit conversion utility (temperature, length, volume, pressure, time)"
arch=('x86_64')
url="https://github.com/jonleithe/unitfy"
license=('MIT')
depends=('readline' 'gcc-libs')
makedepends=('cmake' 'gcc')
_commit='7d3b434ba76233819ff6549f5a551dad124c8a9d'
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('0c8d7ba389b1a408c8be308b440e0c85681fc5a216a0d11c60874e1609dba0ad')

build() {
    cmake \
        -S "$pkgname-$_commit" \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUNITFY_PKGREL="$pkgrel" \
        -DBUILD_TESTING=OFF
    cmake --build build
}

check() {
    cmake \
        -S "$pkgname-$_commit" \
        -B build-test \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUNITFY_PKGREL="$pkgrel" \
        -DBUILD_TESTING=ON
    cmake --build build-test
    ctest --test-dir build-test --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$pkgname-$_commit/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    ln -sf unitfy "$pkgdir/usr/bin/uc"
}
