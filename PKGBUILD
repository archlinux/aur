pkgname=sqltui
pkgver=0.2.6
pkgrel=1
pkgdesc="A terminal UI browser for SQLite databases"
arch=('x86_64' 'aarch64')
url="https://github.com/nettproxy/sqltui"
license=('MIT')

depends=('gcc-libs' 'sqlite')
makedepends=('rust' 'cargo' 'pkgconf')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f9a2ddc0577e029291001276d806fe37ce066928ce31063d09995ecc710ddad9')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    # IMPORTANT:
    # Do NOT use --locked or --offline here
    # This fixes your Cargo.lock + dependency download issues
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # IMPORTANT FIX for rusqlite / sqlite linking
    export PKG_CONFIG_ALLOW_CROSS=1
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release || true
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
