# Maintainer: jonleithe
pkgname=unitfy
pkgver=1.0.2
pkgrel=7
pkgdesc="Command-line unit conversion utility (temperature, length, volume, pressure)"
arch=('x86_64')
url="https://github.com/jonleithe/unitfy"
license=('MIT')
depends=('readline' 'gcc-libs')
makedepends=('cmake' 'gcc')
_commit='39af84d95fb4bb7b92a15d69dfd39d6479c99e7b'
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('3cb9e6cae270dde2e7196c5d750b7e7a0bef6abd33825d9a09ab323e610ff632')

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
