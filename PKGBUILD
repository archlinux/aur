# Maintainer: fireflylabs
pkgname=abstract-editor
pkgver=0.1.3
pkgrel=1
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
sha256sums=('03f994e436d4683e1ad69f7642361a6edc1edcb60a0f877c2ccb7515f6e5e8d9')

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
