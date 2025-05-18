# Maintainer: Abhinav Gupta <mail@abhinavg.net>

pkgname=restack
pkgver=0.8.0
pkgrel=1
pkgdesc='Makes interactive Git rebase aware of intermediate branches.'
arch=(any)
url="https://github.com/abhinav/restack"
license=('GPL-2.0')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f5e8e1de2981250bfb338b46124af81d1972abd56dc5e59a42e8fa6ec5aa796b')

prepare() {
	( cd "$pkgname-$pkgver" &&
		cargo fetch --locked --target "$CARCH-unknown-linux-gnu" )
}

build() {
	export RUSTUP_TOOLCHAIN=nightly-2024-07-30
	export CARGO_TARGET_DIR=target
	( cd "$pkgname-$pkgver" &&
		cargo build --frozen --release \
		--target "$CARCH-unknown-linux-gnu" &&
		strip "target/$CARCH-unknown-linux-gnu/release/restack" )
}

check() {
	"$pkgname-$pkgver/target/$CARCH-unknown-linux-gnu/release/restack" --version
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/$CARCH-unknown-linux-gnu/release/restack" "${pkgdir}/usr/bin/restack"
}
