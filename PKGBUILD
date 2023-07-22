# Maintainer: Salamandar <felix@piedallu.me>

pkgname=pylyzer
pkgver=0.0.37
pkgrel=1
pkgdesc='A fast static code analyzer & language server for Python'
arch=('any')
url='https://github.com/mtshiba/pylyzer'
license=('MIT')
makedepends=(
    'cargo'
)
depends=(
)

source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'e085e07e41115ab2eaa894c04ed6cbacfc9665dbcd9c61426fd8147e802a0f90'
)
# Disable checks for now...
BUILDENV+=('!check')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
