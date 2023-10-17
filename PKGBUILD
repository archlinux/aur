# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=casr
pkgver=2.9.0
pkgrel=1
pkgdesc="Collect crash (or UndefinedBehaviorSanitizer error) reports, triage, and estimate severity."
arch=('x86_64' 'aarch64')
url="https://github.com/ispras/casr"
license=('APACHE')
depends=('gcc-libs' 'gdb' 'lsb-release')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('74b59a0a3e1dc70408fe92d220b939d86c94579d6443e42b3d38d8a735297c445410957431eb29f2017e5ea1fd2279f0f1631aa7be101f7343c63b299549f3cb')

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
