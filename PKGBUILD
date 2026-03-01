# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hashcards
pkgver=0.3.0
pkgrel=1
pkgdesc="Plain text-based spaced repetition system for flashcards"
arch=('x86_64')
url="https://github.com/eudoxia0/hashcards"
license=('Apache-2.0')
depends=('libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8fb1b654f279a04db1ce5f4c5704c3f76a68079f55ae7dae3aacbe7ef4001cd9')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    ## TODO: remove after (0.3.0)
    cargo update
    cargo fetch --locked --target host-tuple
    ## TODO: figure out how to build against system katex
    make vendor/katex
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
