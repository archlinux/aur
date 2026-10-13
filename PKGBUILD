# Maintainer: Aaron Friesen <aaron@frie.dev>
# Contributor: Sheikh Limon <sheikhlimon404@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=goose-cli
pkgver=1.53.0
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
b2sums=(
	'1d13d051e826561c5c4b7a88e237d567505d72ccf1a3c566027d4c1181e5dc0e027d1cc1e1f23861bf9bff7c7020fd787d774b7eb180e7641a1ce97180544b5f'
)
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
