# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=casr
pkgver=2.8.1
pkgrel=1
pkgdesc="Collect crash (or UndefinedBehaviorSanitizer error) reports, triage, and estimate severity."
arch=('x86_64' 'aarch64')
url="https://github.com/ispras/casr"
license=('APACHE')
depends=('gcc-libs' 'gdb' 'lsb-release')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('16bb689f1c1a9132ee7936d5df405dbc2a43fa3b06cef4b12a63ec0ab3b7f4b891fc5aa5cebc70692ddcee57baf1f93b006ced0272ab745cdf9fdc623ae8b6b0')

prepare() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
check() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --workspace --frozen --all-features
}
package() {
	cd "$pkgname-$pkgver"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
