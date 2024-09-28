# Maintainer: chettoy <chettoy@with.moe>
pkgname=apexsky
pkgver=b157.g10c4c37
_pkgver=10c4c37ca6270a342063b8b89f9228c8ce9d7b91
pkgrel=1
pkgdesc="A game mod loader with integrated aimbot and ESP"
arch=(x86_64)
url="https://github.com/chettoy/apexsky"
license=('GPL-3.0-or-later')
depends=(
	alsa-lib
	wayland
	wayland-protocols
)
makedepends=(
	cargo-nightly
	clang
	lld
	protobuf
	zstd
)
checkdepends=()
optdepends=('libusb: DMA device support')
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/chettoy/apexsky/archive/$_pkgver.tar.gz")
sha256sums=('0d82b6c2120d45d40234376e28c00bb8bfb578bc3ec1ffaafcb53c11e19ddb1f')

prepare() {
	cd "$pkgname-$_pkgver/apexsky"

	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$_pkgver/apexsky"

	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
	cd "apexsky_overlay"
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$_pkgver/apexsky"

	export RUSTUP_TOOLCHAIN=nightly
	#cargo test --frozen
}

package() {
	cd "$pkgname-$_pkgver"

	install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

	cd "apexsky"

	install -Dm0755 "target/release/apexsky_dma" "$pkgdir/usr/bin/apexsky_dma" 

	cd "apexsky_overlay"

	install -Dm0755 "target/release/apexsky_overlay" "$pkgdir/usr/bin/apexsky_overlay" 
}
