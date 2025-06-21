# Maintainer: Mark Pendlebury <mark@example.com>

pkgname=eleviewr
pkgver=0.4.0
pkgrel=1
pkgdesc="A lightweight image viewer for Wayland/Hyprland"
arch=('x86_64')
url="https://github.com/markpendlebury/EleViewr"
license=('MIT')
depends=()
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/markpendlebury/EleViewr/archive/v$pkgver.tar.gz")
sha256sums=('f07f7458fbb1768355b75b392ea84123d934c52ea526a8338116bb41f6f88eb8')

prepare() {
    cd "$srcdir/EleViewr-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/EleViewr-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/EleViewr-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/EleViewr-$pkgver"
    
    # Install binary
    install -Dm755 target/release/eleviewr "$pkgdir/usr/bin/eleviewr"
    
    # Install desktop file
    install -Dm644 eleviewr.desktop "$pkgdir/usr/share/applications/eleviewr.desktop"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install logo
    install -Dm644 images/logo.png "$pkgdir/usr/share/pixmaps/eleviewr.png"
}