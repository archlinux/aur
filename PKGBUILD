# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=shotman
pkgver=0.2.0
pkgrel=3
pkgdesc="Uncompromising screenshot GUI for Wayland"
arch=("x86_64" "aarch64")
url="https://git.sr.ht/~whynothugo/shotman"
license=('ISC')
depends=("libxkbcommon")
optdepends=(
    "sway: screenshots of a single window on swaywm"
    "slurp: screenshots of a region on swaywm"
)
makedepends=("git" "cargo")
source=("shotman-${pkgver}::git+https://git.sr.ht/~whynothugo/shotman#tag=v${pkgver}?signed")
sha512sums=("SKIP")
validpgpkeys=("1204CA9FC2FFADEEDC2961367880733B9D062837")

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
