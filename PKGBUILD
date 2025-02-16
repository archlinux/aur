# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose
pkgver=1.0.6
pkgrel=1
pkgdesc="An open-source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/block/goose"
license=('Apache-2.0')
depends=()
makedepends=(
	'cargo'
	'libxcb'
)
optdepends=(
	'bash: developer and computer controller extensions'
	'ruby: computer controller extension'
	'ripgrep: searching in developer extension'
	'ollama: locally-running models'
	'org.freedesktop.secrets: API key management'
	'xdg-desktop-portal: screenshot capabilities on Wayland'
	'libxcb: window and screenshot capabilities on X'
)
# LTO is broken for dependency ring https://github.com/briansmith/ring/issues/1444
options=('!lto')
source=("https://github.com/block/goose/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bf69a41d38a22b86d5152ec048c8150610b35bbed8c6d75596041564ff62d529a06ffc7046ae3724d540a033f0eb7ed05919999eaf5d3d35b0cba4e9e5eb2814')

prepare() {
	cd "goose-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	# can be removed if upstream checks in Cargo.lock
	cargo update

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
	# config::base::tests needs dbus
	# https://github.com/block/goose/blob/0ca4cf01c712c3d557395ab2cc14b1ef6370da21/.github/workflows/ci.yml#L75
	# some other tests that touch the filesystem fail in aur-build for some reason - feel free to use --nocheck
	cargo test --frozen --all-features --workspace --exclude goose
}

package() {
	cd "goose-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/goose"
}
