# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=the-honkers-railway-launcher
pkgver=1.13.0
pkgrel=1
pkgdesc="The Honkers Railway launcher for Linux with automatic patching and telemetry disabling"
arch=('x86_64')
url="https://github.com/an-anime-team/the-honkers-railway-launcher"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'glib2'
	 'pango' 'xz' 'bzip2' 'cairo' 'p7zip' 'wayland' 'git' 'libwebp-utils')
makedepends=('cargo')
optdepends=(
	 'mangohud: FPS Overlay'
	 'gamescope: Micro-Compositor'
	 'gamemode: CPU Scaling Control')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c223db3f7e8f01d936adb13c68f6eef734100ad42cc31adb367ec6b9171d4edf')

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
	install -Dm755 "target/release/${pkgname:4}" "$pkgdir/usr/bin/${pkgname:4}"
	install -Dm644 "assets/${pkgname:4}.desktop" "$pkgdir/usr/share/applications/${pkgname:4}.desktop"
	install -Dm644 "assets/images/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/moe.launcher.${pkgname}.png"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	ln -s "/usr/share/icons/hicolor/512x512/apps/moe.launcher.${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname:4}.png"
	sed -i "s/Exec=AppRun/Exec=${pkgname:4}/g" "$pkgdir/usr/share/applications/${pkgname:4}.desktop"
	sed -i "s/Icon=icon/Icon=${pkgname:4}/g" "$pkgdir/usr/share/applications/${pkgname:4}.desktop"
	echo "StartupWMClass=moe.launcher.${pkgname}" >> "$pkgdir/usr/share/applications/${pkgname:4}.desktop"
}
