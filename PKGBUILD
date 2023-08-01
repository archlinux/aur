# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=cooklang-chef
pkgver=0.4.2
pkgrel=1
pkgdesc=" A CLI to manage cooklang recipes"
arch=("x86_64")
url="https://github.com/Zheoni/cooklang-chef"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate" "https://github.com/Zheoni/cooklang-chef/raw/v$pkgver/LICENSE")
sha256sums=('4f974f96e0d5ae7ae46cefd8b5b97f2ece52b405d28d13c8c751ccd0822e9306'
	'SKIP')

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
	cargo test --frozen --all-features
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname-$pkgver"
	find target/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
