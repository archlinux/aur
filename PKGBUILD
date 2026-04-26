# Maintainer: jonleithe
pkgname=unitfy
pkgver=1.0.1
pkgrel=1
pkgdesc="Command-line unit conversion utility (temperature, length, volume, pressure)"
arch=('x86_64')
url="https://github.com/jonleithe/delta"
license=('MIT')
depends=('readline' 'gcc-libs')
makedepends=('cmake' 'ninja' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jonleithe/delta/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec426ba25083b97093a1045196f189ba453582b468484ffaacecf18ba4a4a708')

build() {
    cmake \
        -S "delta-$pkgver" \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

check() {
    cmake \
        -S "delta-$pkgver" \
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

    install -Dm644 "delta-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    ln -sf unitfy "$pkgdir/usr/bin/uc"
}
