# Maintainer: chordtoll <arch@chordtoll.com>
pkgname=pyxis-parcel
pkgver=0.1.2
pkgrel=1
pkgdesc="Utilities to manipulate parcel archives for the pyxis package manager"
license=("MIT")
arch=("x86_64")
depends=("fuse3" "gcc-libs")
makedepends=("cargo")
url="https://github.com/chordtoll/pyxis-parcel"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('ebfe0ede45d3f7b720f1ef7890a6eb312e5ea561ccc36c27d7f6c2cb091791a5')

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

