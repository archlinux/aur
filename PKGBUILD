# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose
pkgver=1.0.5
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
b2sums=('aca4c135c7f73b1995c8324230517f6c3b82262cb7f8055073b6e58242ade021d4fc27f5459fcc651b1485bffe642305acbab5c185ed64aaa9fb716e81140112')

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
	# config::base::tests needs DBUS
	# https://github.com/block/goose/blob/0ca4cf01c712c3d557395ab2cc14b1ef6370da21/.github/workflows/ci.yml#L75
	cargo test --frozen --all-features --workspace --exclude goose
}

package() {
	cd "goose-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/goose"
}
