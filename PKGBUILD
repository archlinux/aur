# Maintainer: Lily <pika@pikafan.de>
# Maintainer: CarbonSmasher

_pkgname=nitrolaunch
pkgname=$_pkgname-gui
pkgver=0.31.0
pkgrel=1
pkgdesc="A fast, extensible, and powerful Minecraft launcher (GUI Version)"
arch=(x86_64 aarch64)
url="https://github.com/Nitrolaunch/nitrolaunch"
license=('GPL-3.0-or-later')
depends=(freetype2 fontconfig libglvnd libgcc libstdc++ glibc)
makedepends=(cargo imagemagick)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8d951f86e65b4ef72dc44199151b0ee5ac2a539d70944601c25a465ddc98f80b')
options=(!lto)

prepare() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	magick crates/gui/assets/icon_1024x1024.png -resize 512x crates/gui/assets/icon_512x512.png
	cargo build --locked -p nitro_gui --frozen --profile fast_release
}

check() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm0755 "target/fast_release/nitro_gui" "$pkgdir/usr/bin/Nitrolaunch"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "crates/gui/assets/Nitrolaunch.desktop"
	install -Dm0644 "crates/gui/assets/icon_1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/nitro_gui.png"
	install -Dm0644 "crates/gui/assets/icon_512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/nitro_gui.png"
}
