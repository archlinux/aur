# Maintainer: Cosmin Gabriel Georgescu <cosmingg2013@gmail.com>
pkgname="duckscript"
pkgver=0.11.0
pkgrel=1
pkgdesc="Simple, extendable and embeddable scripting language."

# https://github.com/sagiegurari/duckscript#installation-binary-release
arch=("x86_64")

url="https://sagiegurari.github.io/duckscript/"

# https://github.com/sagiegurari/duckscript/blob/master/LICENSE
license=("Apache-2.0")

makedepends=("cargo")

source=("$pkgname-$pkgver.tar.gz::https://github.com/sagiegurari/duckscript/archive/$pkgver.tar.gz")

sha512sums=('4680be909c133fe5519e0d302f72e0251c877ded902ca76b71e5c6aa0eca5a74023bda84bcc96f2667f33814436bb681b3d322aefca7d1d8ee1adc4cfbc50454')
b2sums=('2521b16e59e91214505d6a208cad2c76cb81942e7dbd80e4431ff52ec3739c1b361a6896eaec410d52c4576e1b60e7fe9d8fc0dafdcd24aa7332379682bdd62f')


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
