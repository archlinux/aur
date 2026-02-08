pkgname=lazyrss
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based RSS/Atom feed reader TUI inspired by lazygit"
arch=('x86_64')
url="https://github.com/sujaltv/lazyrss"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('82b71c026e0635a5d86ba742d7a90d8f2b84f5aff8d3ecddc53a878c64842aa9')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
