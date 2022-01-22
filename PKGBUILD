# Maintainer: chordtoll <arch@chordtoll.com>
pkgname=pyxis-fs-client
pkgver=1.0.0
pkgrel=1
pkgdesc="Pyxis network filesystem- client code"
license=("MIT")
arch=("x86_64")
depends=("fuse3" "gcc-libs")
makedepends=("cargo")
url="https://github.com/chordtoll/pyxis-fs-client"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('552db0247e4e36e837639975ea2f2b61606540b7621af8954554e2906d816b35')

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

