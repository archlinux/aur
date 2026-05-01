pkgname=sqltui
pkgver=0.2.2
pkgrel=1
pkgdesc="A terminal UI browser for SQLite databases"
arch=('x86_64' 'aarch64')
url="https://github.com/nettproxy/sqltui"
license=('MIT')

depends=('gcc-libs' 'sqlite')
makedepends=('rust' 'cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4ee468efe444ec5dd9265e8a8463f780a6e8c81b64518536dd7415dd1a61015f')

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
