# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose
pkgver=1.32.0
pkgrel=1
pkgdesc="An open-source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/aaif-goose/goose"
license=('Apache-2.0')
depends=()
makedepends=(
	'cargo'
	'clang'
	'cmake'
	'cuda'
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
	'cuda: CUDA GPU acceleration for local inference and whisper'
)
# LTO is broken for dependency ring https://github.com/briansmith/ring/issues/1444
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aaif-goose/goose/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3378005479229e277a4063e1dd5b92f7680804ce9e84e9815d0be849612b25e98e5c3bad10db396c85d6245d91d31f6e3ea5fd1420e283a9a664ff3d1295ea76')

prepare() {
	cd "goose-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "goose-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# Ampere (sm_80) needed for bf16 WMMA; covers RTX 3000+ via forward compat
	# Required because no GPU in build chroot for auto-detection
	export CUDA_COMPUTE_CAP=80
	cargo build --frozen --release -p goose-cli --features cuda,disable-update
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
