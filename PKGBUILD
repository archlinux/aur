# Maintainer: Lily <pika@pikafan.de>
# Maintainer: CarbonSmasher

_pkgname=nitrolaunch
pkgname=$_pkgname-gui
pkgver=0.29.0
pkgrel=1
pkgdesc="A fast, extensible, and powerful Minecraft launcher (GUI Version)"
arch=(x86_64 aarch64)
url="https://github.com/Nitrolaunch/nitrolaunch"
license=('GPL-3.0-or-later')
depends=(webkit2gtk-4.1)
makedepends=(cargo cargo-tauri npm imagemagick)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ccb76d3b467a8cd24f9440e0d32ecd829bc64de4d040a51545b7eb9a447dd64e')
options=(!lto)

prepare() {
	cd "$_pkgname-$pkgver/gui"
	npm i
	cd src-tauri
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd "$_pkgname-$pkgver/gui/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
	magick icons/icon_1024x1024.png -resize 512x icons/icon_512x512.png
	cargo tauri build --no-bundle -- --frozen --profile fast_release --all-features
}

check() {
	cd "$_pkgname-$pkgver" # Tests are in the library, no need to `cd` into the gui
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/fast_release/Nitrolaunch"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "gui/Nitrolaunch.desktop"
	install -Dm0644 "gui/src-tauri/icons/icon_1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/nitrolaunch.png"
	install -Dm0644 "gui/src-tauri/icons/icon_512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/nitrolaunch.png"
}
