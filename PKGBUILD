pkgname=sqltui
pkgver=0.2.3
pkgrel=1
pkgdesc="A terminal UI browser for SQLite databases"
arch=('x86_64' 'aarch64')
url="https://github.com/nettproxy/sqltui"
license=('MIT')

depends=('gcc-libs')
makedepends=('rust' 'cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('18c4270d26f77697c4eebb8f9492e8c7d34bcdacd7151211a1bc325b573e2eeb')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    export RUSTFLAGS="-C link-arg=-lsqlite3"

    cargo build --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    cargo test --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
