# Maintainer: fireflylabs
pkgname=abstract-editor
pkgver=0.1.0
pkgrel=2
pkgdesc="Minimal local-first markdown notes editor, GPU-rendered with GPUI"
arch=('x86_64' 'aarch64')
url="https://github.com/fireflylabss/abstract"
license=('Apache-2.0' 'OFL-1.1')
depends=(
	'libxkbcommon'
	'libxkbcommon-x11'
	'libxcb'
	'xcb-util-wm'
	'xcb-util-image'
	'xcb-util-keysyms'
	'xcb-util-renderutil'
	'wayland'
	'fontconfig'
	'alsa-lib'
	'gcc-libs'
	'glibc'
)
makedepends=('rust' 'pkgconf')
provides=('abstract')
conflicts=('abstract-editor-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fireflylabss/abstract/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ddc61bd55cc0a3ccb1aac3f095b4da2b1cd426d25d3bba5322a280597446698c')

prepare() {
	cd "abstract-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked
}

build() {
	cd "abstract-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --frozen
}

check() {
	cd "abstract-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "abstract-$pkgver"
	install -Dm755 target/release/abstract "$pkgdir/usr/bin/abstract"
	install -Dm644 assets/abstract.desktop "$pkgdir/usr/share/applications/abstract.desktop"
	install -Dm644 assets/abstract.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/abstract.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 assets/fonts/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
