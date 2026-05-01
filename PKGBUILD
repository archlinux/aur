# Maintainer: Rudolf Schmidt <info@rudolfschmidt.com>
pkgname=accounting
_cratename=acc
pkgver=0.4.1
pkgrel=1
pkgdesc="plaintext double-entry accounting command line tool"
arch=('x86_64')
url="https://github.com/rudolfschmidt/acc"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
conflicts=('acc')
source=("$_cratename-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_cratename/$pkgver/download")
sha256sums=('0c57378160020be97b0fe3fa7a54268734804b06dd462c757d5eca37c5426b82')

prepare() {
    cd "$_cratename-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_cratename-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$_cratename-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked
}

package() {
    cd "$_cratename-$pkgver"
    install -Dm755 "target/release/$_cratename" "$pkgdir/usr/bin/$_cratename"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
