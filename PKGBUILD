# Maintainer: chordtoll <git@chordtoll.com>
pkgname=pyxis-manage
pkgver=0.2.1
pkgrel=1
pkgdesc="The pyxis package manager"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
url="https://github.com/chordtoll/pyxis-manage"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f00a5eaa0bfa5165cda71b8057a204c12dba6de7dcc7a92b7590fb56e4fde613')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

