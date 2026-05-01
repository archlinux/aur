pkgname=sqltui
pkgver=0.2.5
pkgrel=1
pkgdesc="A terminal UI browser for SQLite databases"
arch=('x86_64' 'aarch64')
url="https://github.com/nettproxy/sqltui"
license=('MIT')

depends=('gcc-libs' 'sqlite')
makedepends=('rust' 'cargo' 'pkgconf')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('17f662c937c83c92f8a74390631cd3017ee40a21fc82f56202dbb4c409908d25')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    # This is SAFE (downloads deps once properly)
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
