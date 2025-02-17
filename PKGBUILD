# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Salamandar <felix@piedallu.me>

pkgname=pylyzer
pkgver=0.0.45
pkgrel=1
pkgdesc='A fast, feature-rich static code analyzer & language server for Python'
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
    'c3980ebb0c0ce825f0e50a3ae9f5e8d1af4b5b712bc99c4cff2205b594cba99a'
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
