# Maintainer: Cosmin Gabriel Georgescu <cosmingg2013@gmail.com>
pkgname="duckscript"
pkgver=0.9.3
pkgrel=1
pkgdesc="Simple, extendable and embeddable scripting language."

# https://github.com/sagiegurari/duckscript#installation-binary-release
arch=("x86_64")

url="https://sagiegurari.github.io/duckscript/"

# https://github.com/sagiegurari/duckscript/blob/master/LICENSE
license=("Apache-2.0")

makedepends=("cargo")

source=("$pkgname-$pkgver.tar.gz::https://github.com/sagiegurari/duckscript/archive/$pkgver.tar.gz")

sha512sums=('d7c70194646083c4613ceff2c5b1a832c145e92829e2db479d9c3dc7d260e50fa270b9be6beefbb4233761fa63f203c5532ac2e7ff3e3d05258ac5a8269c3acc')
b2sums=('bd6cf605d834da5a0a8c84b9d5ff9693e2a1f0bc770c80818ad6e1e0784ad26debc2f88c7264c52418e52ff08a3c974be23abcf8b02c9ebff6b000c922592741')


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
