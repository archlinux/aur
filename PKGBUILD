# Maintainer: Cosmin Gabriel Georgescu <cosmingg2013@gmail.com>
pkgname="duckscript"
pkgver=0.9.4
pkgrel=1
pkgdesc="Simple, extendable and embeddable scripting language."

# https://github.com/sagiegurari/duckscript#installation-binary-release
arch=("x86_64")

url="https://sagiegurari.github.io/duckscript/"

# https://github.com/sagiegurari/duckscript/blob/master/LICENSE
license=("Apache-2.0")

makedepends=("cargo")

source=("$pkgname-$pkgver.tar.gz::https://github.com/sagiegurari/duckscript/archive/$pkgver.tar.gz")

sha512sums=('e7543fd81f1e07288c726f1bae7e0cc2985a2e2642639fda47c9a53f08cb25c77fd88e0048bd15decfcfa85bcbad4effbe693c1ec2339cbcad84805f1b77e936')
b2sums=('1c7595c09cbcaded146a93e35fd17e24ac16ff61fe9afedb1060cbf4c6c74565931dca5242ca9e2a1971dbb350ea770ba14e3dc2434cc49d21e5f7f074aac0fd')


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
