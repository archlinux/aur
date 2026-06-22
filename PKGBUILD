# Maintainer: dividebysandwich <josef.jahn@gmail.com>

pkgname=wordstar-rs
pkgver=0.3.1
pkgrel=1
pkgdesc="A faithful DOS WordStar 7 clone for the terminal, written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/dividebysandwich/wordstar-rs"
license=('GPL-2.0-only')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6839c42638a80df46f66504a5a021fa0e7044e84d0cc1bf23f160cae3c869ebe')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin "$pkgname"
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
