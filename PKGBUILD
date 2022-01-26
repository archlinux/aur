# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=avml
pkgver=0.4.1
pkgrel=1
pkgdesc='A portable volatile memory acquisition tool for Linux'
arch=('x86_64')
url='https://github.com/microsoft/avml'
license=('MIT')
makedepends=('musl' 'rust-musl')
source=("https://github.com/microsoft/avml/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f13a5c59e978b688623e67c7497dedc165a2955216dd947eacaf23d801c72aea')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-musl"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --target $CARCH-unknown-linux-musl
}

package() {
	cd "$pkgname-$pkgver"
	find target/$CARCH-unknown-linux-musl/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
