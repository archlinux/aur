# Maintainer: Eduardo Vozniak <evozniak@gmail.com>
pkgname=risemode-driver
pkgver=0.1.0
pkgrel=1
pkgdesc="An experimental Rust driver for the Rise Mode Aura Ice Black water cooler"
arch=('x86_64' 'aarch64')
url="https://github.com/evozniak/risemode-driver"
license=('MIT')
depends=('hidapi')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install systemd service
    install -Dm644 risemode-driver.service "$pkgdir/usr/lib/systemd/system/risemode-driver.service"
    
    # Install udev rules for device permissions
    install -Dm644 - "$pkgdir/usr/lib/udev/rules.d/99-risemode.rules" <<EOF
# Rise Mode Aura Ice Black water cooler
SUBSYSTEM=="usb", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="7698", MODE="0666", GROUP="users"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="7698", MODE="0666", GROUP="users"
EOF
}
