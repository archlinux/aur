# Maintainer: moxer-mmh
pkgname=sysdx
pkgver=0.1.0
pkgrel=1
pkgdesc="A systemd unit manager TUI with vim keybinds and theme support"
arch=('x86_64' 'aarch64')
url="https://github.com/moxer-mmh/sysdx"
license=('MIT')
depends=('systemd')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e047aadac1863c90165f04beba993e4b392a96a3da0c6fb77f7e5990be931a2')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "config.example.toml" \
        "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
