# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=restack
pkgver=0.6.0
pkgrel=1
pkgdesc='Makes interactive Git rebase aware of intermediate branches.'
arch=(any)
url="https://github.com/abhinav/restack"
license=('MIT')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f56b4f9d0c3cbe49e7ad67efb409962c7303bf4ea8c21a8dc4273b76725e5109')

prepare() {
	( cd "$pkgname-$pkgver" &&
		cargo fetch --locked --target "$CARCH-unknown-linux-gnu" )
}

build() {
	export RUSTUP_TOOLCHAIN=nightly-2022-09-21
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
