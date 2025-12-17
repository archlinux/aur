# Maintainer: Bram <bram+sway@pescheck.io>
pkgname=sway-mirror
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast zero-copy screen mirroring for Sway/wlroots"
arch=('x86_64' 'aarch64')
url="https://github.com/pescheckit/sway-mirror"
license=('MIT')
depends=('wayland' 'libgbm' 'libdrm')
makedepends=('cargo' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pescheckit/sway-mirror/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
