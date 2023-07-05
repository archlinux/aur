# Maintainer: Abhinav Gupta <mail@abhinavg.net>

pkgname=restack
pkgver=0.7.0
pkgrel=1
pkgdesc='Makes interactive Git rebase aware of intermediate branches.'
arch=(any)
url="https://github.com/abhinav/restack"
license=('GPL-2.0')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('a6e6381a632104cb2d1a2e2104a98fdab40c23e9f222bdff53641b7bfb3d8513')

prepare() {
	( cd "$pkgname-$pkgver" &&
		cargo fetch --locked --target "$CARCH-unknown-linux-gnu" )
}

build() {
	export RUSTUP_TOOLCHAIN=nightly-2023-06-29
	export CARGO_TARGET_DIR=target
	( cd "$pkgname-$pkgver" &&
		cargo build --frozen --release \
		--target "$CARCH-unknown-linux-gnu" \
		-Z build-std=std,panic_abort \
		-Z build-std-features=panic_immediate_abort &&
		strip "target/$CARCH-unknown-linux-gnu/release/restack" )
}

check() {
	"$pkgname-$pkgver/target/$CARCH-unknown-linux-gnu/release/restack" --version
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/$pkgname" "$pkgname-$pkgver/target/$CARCH-unknown-linux-gnu/release/restack"
}
