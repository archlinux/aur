# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=casr
pkgver=2.7.0
pkgrel=1
pkgdesc="Collect crash (or UndefinedBehaviorSanitizer error) reports, triage, and estimate severity."
arch=('x86_64' 'aarch64')
url="https://github.com/ispras/casr"
license=('APACHE')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('89cc72f1451f83872c02858cb7b2a275111b9025fd12196999493aad03d91398c9b9c6fd42fdbf31cc403e162d3af8200adb020965c9e2e2f9a0ad8aa4dc1c25')

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
