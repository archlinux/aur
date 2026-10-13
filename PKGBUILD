# Maintainer: Aaron Friesen <aaron@frie.dev>
# Contributor: Sheikh Limon <sheikhlimon404@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=goose-cli
pkgver=1.54.0
pkgrel=1
pkgdesc='An open source, extensible AI agent that goes beyond code suggestions (CLI)'
arch=('x86_64')
url='https://github.com/aaif-goose/goose'
license=('Apache-2.0')
depends=(
	'glibc'
	'gcc-libs'
	'libgcc'
	'libstdc++'
	# Used by webbrowser crate for OAuth
	'xdg-utils'
	# Local inference on GPU via llama.cpp
	'vulkan-icd-loader'
)

makedepends=(
	'cargo'
	'clang'
	'cmake'
	# Local inference on GPU via llama.cpp
	'vulkan-headers'
	'shaderc'
)

# LTO breaks sqlx/sqlite linkage
options=('!lto' '!debug')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/aaif-goose/goose/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=('13ec424b0391e5358955bad69cd54b9b1f78fbdb728195a80f5163d0a083c4018b7e6747c56dfd4ff37f3900007acaee61e1241e86a7147283ae552e241b4ca6')
conflicts=('goose-desktop')

prepare() {
	cd "goose-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target host-tuple
}

build() {
	cd "goose-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features vulkan --package goose-cli --bin goose
}

package() {
	cd "goose-$pkgver"
	install -Dm755 target/release/goose "$pkgdir/usr/bin/goose"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
