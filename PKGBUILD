# Maintainer: Cosmin Gabriel Georgescu <cosmingg2013@gmail.com>
pkgname="duckscript"
pkgver=0.9.1
pkgrel=1
pkgdesc="Simple, extendable and embeddable scripting language."

# https://github.com/sagiegurari/duckscript#installation-binary-release
arch=("x86_64")

url="https://sagiegurari.github.io/duckscript/"

# https://github.com/sagiegurari/duckscript/blob/master/LICENSE
license=("Apache")

makedepends=("cargo")

source=("$pkgname-$pkgver.tar.gz::https://github.com/sagiegurari/duckscript/archive/$pkgver.tar.gz")

sha512sums=('8c1d79464efcad3f60ad10e08aabd585197359b294479aa5c7f161612b0ba7a60b1ecaadc408b4267ef82a7fd20a584ae41a085aa39fbd64173255c0a54485d7')
b2sums=('0ae6a71771af6e3287cd49f520b5c00475d733a5728f3b1432f55d0dbb4c71919537853e4dedaec0a2837686f1ee43acd3dd7dbb093c6ab48a59c84336915b1b')


prepare(){
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$arch-unknown-linux-gnu"
}

build(){
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --workspace --release --all-features
}

check(){
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --workspace --all-features
	cargo test --frozen --workspace --all-features -- --ignored --test-threads=1
} 

package(){
	install --verbose -D --mode 755 --target-directory "$pkgdir/usr/bin" "$pkgname-$pkgver/target/release/duck"
	install --verbose -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
	install --verbose -D --mode 644 --target-directory "$pkgdir/usr/share/doc/$pkgname" "$pkgname-$pkgver/CHANGELOG.md"
	install --verbose -D --mode 644 --target-directory "$pkgdir/usr/share/doc/$pkgname" "$pkgname-$pkgver/README.md"
}
