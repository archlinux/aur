# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cranko
pkgver=0.17.3
pkgrel=1
pkgdesc='Cross-platform, cross-language release automation tool'
arch=('x86_64' 'aarch64')
url='https://github.com/pkgw/cranko'
license=('MIT')
depends=('libgcc_s.so' 'libgit2.so' 'libssl.so')
makedepends=('cargo')
changelog=CHANGELOG.md
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname@$pkgver.tar.gz")
sha256sums=('e0ff555b96a0a39a75b3cf4ab98f3e3abfebe2a44c2b3569c2794e35be6252fb')

prepare() {
    cd "$pkgname-$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgname-$pkgver"
    ## do not use --all-features; this will build using a vendored SSL library
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgname-$pkgver"
    install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
