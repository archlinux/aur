# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=casr
pkgver=2.8.0
pkgrel=1
pkgdesc="Collect crash (or UndefinedBehaviorSanitizer error) reports, triage, and estimate severity."
arch=('x86_64' 'aarch64')
url="https://github.com/ispras/casr"
license=('APACHE')
depends=('gcc-libs' 'gdb' 'lsb-release')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('a340ecd3ccd3266944051c20b95962729b6bbda367d2f5771bf40faea286980567565d671f272d23b6583887fe4b5e1ab876753e86c2d626f4941da69df9f32a')

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
