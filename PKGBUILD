# Maintainer: jonleithe
pkgname=unitfy
pkgver=1.0.2
pkgrel=2
pkgdesc="Command-line unit conversion utility (temperature, length, volume, pressure)"
arch=('x86_64')
url="https://github.com/jonleithe/unitfy"
license=('MIT')
depends=('readline' 'gcc-libs')
makedepends=('cmake' 'ninja' 'gcc')
_commit='3bf5e85968741370d187e81e7e6a0b7fd798c2dc'
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('ac8922ff8bf1c8bb460d6a5509eb1b0a231301fdfd3c91286e05a4445953f6c0')

build() {
    cmake \
        -S "$pkgname-$_commit" \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

check() {
    cmake \
        -S "$pkgname-$_commit" \
        -B build-test \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
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
