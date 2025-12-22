# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hashcards
pkgver=0.2.1
pkgrel=1
pkgdesc="Plain text-based spaced repetition system for flashcards"
arch=('x86_64')
url="https://github.com/eudoxia0/hashcards"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37be85ab9b0d560a77188b86d2fef578a62152b48f85c707dbab212cd863c195')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
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
