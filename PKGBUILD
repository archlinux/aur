# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=casr
pkgver=2.11.1
pkgrel=1
pkgdesc="Collect crash (or UndefinedBehaviorSanitizer error) reports, triage, and estimate severity."
arch=('x86_64' 'aarch64')
url="https://github.com/ispras/casr"
license=('APACHE')
depends=('gcc-libs' 'gdb' 'lsb-release')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('25bb2752665b1d2cd4cab5582b0e9eac6665e962ee70a11345916859c8dacfbfaed50f11638b2c32dd04bc186f8bde834c890cebe81a9bc218f1c79731a0221b')

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
