# Maintainer: éclairevoyant

pkgname=swayhide
pkgver=0.2.1
pkgrel=1
pkgdesc="Window swallower for sway"
url="https://github.com/NomisIV/$pkgname"
license=(GPL3)
arch=(x86_64 aarch64)
depends=(sway)
makedepends=(rust)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('48f63e256713dff6a4bf163c8ac1a8a93d170932d6f87d5601b277bd5724f23567c775747039f31ae2c6351440628f12fcd2a783687d1e6867bbd391927b1248')

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd $pkgname-$pkgver
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd $pkgname-$pkgver
	cargo build --frozen --release --all-features
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 completions/$pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 completions/$pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
