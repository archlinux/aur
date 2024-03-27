# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=cooklang-chef
pkgver=0.8.5
pkgrel=1
pkgdesc=" A CLI to manage cooklang recipes"
arch=("x86_64")
url="https://github.com/Zheoni/cooklang-chef"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate" "LICENSE::https://github.com/Zheoni/cooklang-chef/raw/v$pkgver/LICENSE")
sha256sums=('8b80d2b34e9ffbf540f3e7f84dd13487b3065386da8a500641d8e116dee2dce1'
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
