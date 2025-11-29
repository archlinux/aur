# Maintainer: vadik likholetov <vadikas@gmail.com>
pkgname=litra-autotoggle
pkgver=0.7.0
pkgrel=1
pkgdesc="Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off"
arch=('x86_64' 'aarch64')
url="https://github.com/timrogers/litra-autotoggle"
license=('MIT')
depends=('hidapi')
makedepends=('cargo' 'rust' 'libusb' 'hidapi' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timrogers/litra-autotoggle/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d4b994ab1689f59e62f9fc5a325c4e99840508e1d7455ffaa980893e86531b0')

build() {
    cd "$pkgname-$pkgver"
    RUSTFLAGS="-l hidapi-hidraw" cargo build --release --target-dir=target
}

check() {
    cd "$pkgname-$pkgver"
    RUSTFLAGS="-l hidapi-hidraw" cargo test --release --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install udev rules
    install -Dm644 99-litra.rules "$pkgdir/usr/lib/udev/rules.d/99-litra.rules"
    
    # Install license
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
