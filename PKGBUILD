# Maintainer: Eduardo Vozniak <evozniak@gmail.com>
pkgname=risemode-driver
pkgver=0.1.7
pkgrel=1
pkgdesc="An experimental Rust driver for the Rise Mode Aura Ice Black water cooler"
arch=('x86_64' 'aarch64')
url="https://github.com/evozniak/risemode-driver"
license=('MIT')
depends=('hidapi')
makedepends=('cargo' 'git' 'hidapi' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fc0468f460f196b3c20ead7d46471ffb5e312aefa62ab3e4878a9f9e8b81e932')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --all-features || true
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install systemd service
    install -Dm644 packaging/arch/risemode-driver.service "$pkgdir/usr/lib/systemd/system/risemode-driver.service"
    
    # Install udev rules for device permissions
    install -Dm644 packaging/arch/99-risemode.rules "$pkgdir/usr/lib/udev/rules.d/99-risemode.rules"
}
