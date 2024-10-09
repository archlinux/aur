# Maintainer: chettoy <chettoy@with.moe>
pkgname=apexsky
pkgver=b162.gb62a825
_pkgver=b62a825ba435d53496175bf2f07ce8dbd64a12f9
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
	pkgconf
	protobuf
	zstd
)
checkdepends=()
optdepends=('libusb: DMA device support')
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/chettoy/apexsky/archive/$_pkgver.tar.gz")
sha256sums=('0aad3d74441cd6fb3fff954f3ac2064c6f747f340977cbed3abfbe87c220cdec')

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
	mkdir -p target/autocompletion
	cp target/release/build/apexsky_dma-*/out/* target/autocompletion/

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

	install -Dm0644 "target/autocompletion/apexsky_dma.bash" "$pkgdir/usr/share/bash-completion/completions/apexsky_dma"
	install -Dm0644 "target/autocompletion/apexsky_dma.fish" "$pkgdir/usr/share/fish/completions/apexsky_dma.fish"
	install -Dm0644 "target/autocompletion/_apexsky_dma" "$pkgdir/usr/share/zsh/site-functions/_apexsky_dma"

	cd "apexsky_overlay"

	install -Dm0755 "target/release/apexsky_overlay" "$pkgdir/usr/bin/apexsky_overlay"
}
