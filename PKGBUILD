# Maintainer: Thomas Büngener <tombueng@gmail.com>
pkgname=ptouch-studio
pkgver=0.2.0
pkgrel=1
pkgdesc="Design and print labels for Brother P-touch tape cassettes over Bluetooth"
arch=('x86_64' 'aarch64')
url="https://github.com/tombueng/ptouch-studio"
license=('MIT')
depends=('qt6-base' 'bluez' 'bluez-utils' 'cups' 'ptouch-driver')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02ff8837dd2455e3af2df3c9bb9f536450e2c4aea0c99f306e84f2e6aa0bb80a')

build() {
    cmake -S "$pkgname-$pkgver" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=ON
    cmake --build build
}

check() {
    QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
