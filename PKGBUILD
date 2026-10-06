# Maintainer: Charles Pritchard <charlespritchard.work@gmail.com>
pkgname=shiftpaper
# pkgver and sha256sums are set by the release workflow on each tag.
pkgver=0.4.1
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
sha256sums=('8a88eb33a5a28f71f56ec22ea6ce486fd43a898ce23c907218f0bcfec6ad5932')

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
	install -Dm644 assets/icon/hicolor/scalable/apps/shiftpaper.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/shiftpaper.svg"
	install -Dm644 assets/icon/hicolor/symbolic/apps/shiftpaper-symbolic.svg \
		"$pkgdir/usr/share/icons/hicolor/symbolic/apps/shiftpaper-symbolic.svg"
	install -Dm644 -t "$pkgdir/usr/share/man/man1" assets/man/*.1
	install -Dm644 assets/completions/shiftpaper.bash \
		"$pkgdir/usr/share/bash-completion/completions/shiftpaper"
	install -Dm644 assets/completions/_shiftpaper \
		"$pkgdir/usr/share/zsh/site-functions/_shiftpaper"
	install -Dm644 assets/completions/shiftpaper.fish \
		"$pkgdir/usr/share/fish/vendor_completions.d/shiftpaper.fish"
}
