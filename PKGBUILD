# Maintainer: Charles Pritchard <charlespritchard.work@gmail.com>
pkgname=shiftpaper-git
pkgver=0.3.0.r0.g8b7428a
pkgrel=1
pkgdesc="Parallax wallpaper daemon for Wayland with monocular depth estimation"
arch=('x86_64')
url="https://github.com/CPritch/shiftpaper"
license=('MIT')
depends=('wayland' 'vulkan-icd-loader' 'onnxruntime')
makedepends=('cargo' 'git')
optdepends=('onnxruntime-cuda: bake wallpapers on an NVIDIA GPU')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=("$pkgname::git+https://github.com/CPritch/shiftpaper.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# load-dynamic uses the system onnxruntime instead of downloading one.
	cargo build --frozen --release --package shiftpaper-cli \
		--no-default-features --features load-dynamic
	cargo build --frozen --release --package shiftpaper-daemon
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --release --package shiftpaper-config --package shiftpaper-daemon
	cargo test --frozen --release --package shiftpaper-cli \
		--no-default-features --features load-dynamic
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/shiftpaper "$pkgdir/usr/bin/shiftpaper"
	install -Dm755 target/release/shiftpaperd "$pkgdir/usr/bin/shiftpaperd"
	install -Dm644 shiftpaperd.service "$pkgdir/usr/lib/systemd/user/shiftpaperd.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
