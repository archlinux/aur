pkgname=sqltui
pkgver=0.2.4
pkgrel=1
pkgdesc="A terminal UI browser for SQLite databases"
arch=('x86_64' 'aarch64')
url="https://github.com/nettproxy/sqltui"
license=('MIT')

depends=('gcc-libs' 'sqlite')
makedepends=('rust' 'cargo' 'pkgconf')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a09578458cb52a8c45325c25c000ec88f226a44cc89fb59543ec9717a1ed61cc')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    # IMPORTANT: avoid locked network issues
    cargo fetch --offline
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export PKG_CONFIG_ALLOW_CROSS=1

    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
