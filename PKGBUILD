# Maintainer: jonleithe
pkgname=unitfy
pkgver=1.0.2
pkgrel=3
pkgdesc="Command-line unit conversion utility (temperature, length, volume, pressure)"
arch=('x86_64')
url="https://github.com/jonleithe/unitfy"
license=('MIT')
depends=('readline' 'gcc-libs')
makedepends=('cmake' 'ninja' 'gcc')
_commit='33930af0a88952b3ea83ed0bdb37c23559315c8e'
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('e5d5b0a005c1b1f753b8363d9e71978f650e83bcdc59eb15f7b8b0d6798216f3')

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
