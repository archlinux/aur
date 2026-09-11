# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=honkers-launcher
pkgver=1.14.1
pkgrel=1
pkgdesc="Honkers launcher for Linux with automatic patching and telemetry disabling"
arch=('x86_64')
url="https://github.com/an-anime-team/honkers-launcher"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glibc' 'hicolor-icon-theme' 'libgcc' 'glib2'
	 'pango' 'xz' 'bzip2' 'cairo' '7zip' 'wayland' 'libwebp-utils' 'git')
makedepends=('cargo')
optdepends=(
	 'mangohud: FPS Overlay'
	 'gamescope: Micro-Compositor'
	 'gamemode: CPU Scaling Control')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c51f0850d660995c37f1fd17c7441a0810af2d0cef0f2b16695eab0240677b1d')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "assets/images/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/moe.launcher.$pkgname.png"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	ln -s "/usr/share/icons/hicolor/512x512/apps/moe.launcher.$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	sed -i "s/Exec=AppRun/Exec=$pkgname/g" "$pkgdir/usr/share/applications/$pkgname.desktop"
	sed -i "s/Icon=icon/Icon=$pkgname/g" "$pkgdir/usr/share/applications/$pkgname.desktop"
	echo "StartupWMClass=moe.launcher.$pkgname" >> "$pkgdir/usr/share/applications/$pkgname.desktop"
}
