# Maintainer: Charles Pritchard <charlespritchard.work@gmail.com>
pkgname=shiftpaper
pkgver=0.2.0
pkgrel=1
pkgdesc="Parallax wallpaper daemon for Wayland with monocular depth estimation"
arch=('x86_64')
url="https://github.com/CPritch/shiftpaper"
license=('MIT')
depends=('wayland' 'vulkan-icd-loader' 'onnxruntime')
makedepends=('cargo')
optdepends=('onnxruntime-cuda: bake wallpapers on an NVIDIA GPU')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CPritch/shiftpaper/archive/v$pkgver.tar.gz")
sha256sums=('75217057bc782e2ee25753fad0d6099a947093a5a9e807fcf7cd54b3d0422ce6')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# load-dynamic uses the system onnxruntime instead of downloading one.
	cargo build --frozen --release --package shiftpaper-cli \
		--no-default-features --features load-dynamic
	cargo build --frozen --release --package shiftpaper-daemon
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --release --package shiftpaper-config --package shiftpaper-daemon
	cargo test --frozen --release --package shiftpaper-cli \
		--no-default-features --features load-dynamic
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/shiftpaper "$pkgdir/usr/bin/shiftpaper"
	install -Dm755 target/release/shiftpaperd "$pkgdir/usr/bin/shiftpaperd"
	install -Dm644 shiftpaperd.service "$pkgdir/usr/lib/systemd/user/shiftpaperd.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
