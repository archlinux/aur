# Maintainer: éclairevoyant

pkgname=swayhide
pkgver=0.2.0
pkgrel=2
pkgdesc="Window swallower for sway"
url="https://github.com/NomisIV/$pkgname"
license=("GPL3")
arch=("x86_64" "aarch64")
depends=("sway")
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('330a422aabd0345d9678e957f0694cb0388c22f62b7185911078263913ee08459933de21cbaf9200c3dcc284a2f22359e677cc16971ef772df95f3352efd58b8')

prepare() {
	cd $pkgname-$pkgver
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 completions/$pkname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 completions/$pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 completions/$pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
