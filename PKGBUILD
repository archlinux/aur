# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose
pkgver=1.8.0
pkgrel=1
pkgdesc="An open-source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/block/goose"
license=('Apache-2.0')
depends=()
makedepends=(
	'cargo'
	'libxcb'
	'protobuf'
)
optdepends=(
	'bash: developer and computer controller extensions'
	'ruby: computer controller extension'
	'ripgrep: searching in developer extension'
	'ollama: locally-running models'
	'org.freedesktop.secrets: API key management'
	'xdg-desktop-portal: screenshot capabilities on Wayland'
	'libxcb: window and screenshot capabilities on X'
	'xdotool: computer controller extension on X'
	'wmctrl: computer controller extension on X'
	'xclip: computer controller extension on X'
	'xorg-xwininfo: computer controller extension on X'
	'wtype: computer controller extension on Wayland'
	'wl-clipboard: computer controller extension on Wayland'
)
# LTO is broken for dependency ring https://github.com/briansmith/ring/issues/1444
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/block/goose/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('8d4db6b4327969863086a05fcc117af044e7b03df1dd6d89e186d44f4c7c3d5da609e7ddcbc92bcd256b9993f649796ecec12c52b72dfd8ee5473ddda694f71a')

prepare() {
	cd "goose-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "goose-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "goose-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	# tests touch filesystem and seem super flaky for some reason
	# skip for now
	# cargo test --frozen --all-features --workspace --exclude goose
}

package() {
	cd "goose-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/goose"
}
