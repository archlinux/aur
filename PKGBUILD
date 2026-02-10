# Maintainer: Cosmin Gabriel Georgescu <cosmingg2013@gmail.com>
pkgname="duckscript"
pkgver=0.11.1
pkgrel=1
pkgdesc="Simple, extendable and embeddable scripting language."

# https://github.com/sagiegurari/duckscript#installation-binary-release
arch=("x86_64")

url="https://sagiegurari.github.io/duckscript/"

# https://github.com/sagiegurari/duckscript/blob/master/LICENSE
license=("Apache-2.0")

makedepends=("cargo")

source=("$pkgname-$pkgver.tar.gz::https://github.com/sagiegurari/duckscript/archive/$pkgver.tar.gz")

sha512sums=('1059e7f8169d1249a21e8d4a49c331b1ce402301ea784774ede882cfedf694120475de1c210b2e3a3de38d606a31afd13d73337958b5958aa228ecdf9344a04d')
b2sums=('aa1df83fcf98dc28ac3f7bfc8f1ed1eb720e7e6a29a13e8d13d569fa3c38bacda99fdcfa85d27358e0b6433224b650732bb73438154cda65b9a208c9622a9038')


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
