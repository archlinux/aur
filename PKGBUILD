# Maintainer: jonleithe
pkgname=unitfy
pkgver=1.0.2
pkgrel=1
pkgdesc="Command-line unit conversion utility (temperature, length, volume, pressure)"
arch=('x86_64')
url="https://github.com/jonleithe/delta"
license=('MIT')
depends=('readline' 'gcc-libs')
makedepends=('cmake' 'ninja' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jonleithe/delta/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f430a15a3ae3fa37668af8f47bf088849a579b723874a3feac6a71de616d508')

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
