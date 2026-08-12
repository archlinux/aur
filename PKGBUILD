# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=sleepy-launcher
pkgver=1.7.0
pkgrel=1
pkgdesc="Sleepy game launcher for Linux with telemetry disabling"
arch=(x86_64)
url="https://github.com/an-anime-team/sleepy-launcher"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glibc' 'hicolor-icon-theme' 'glib2' 'libgcc'
	'pango' 'xz' 'bzip2' 'cairo' '7zip' 'wayland' 'libwebp-utils' 'git'
	'gdk-pixbuf2')
makedepends=('cargo')
optdepends=(
	'mangohud: FPS Overlay'
	'gamescope: Micro-compositor'
	'gamemode: CPU Scaling Control')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1291e31dc21e7e555a6fd64ce4510a546a5ae214f1eb86d8a78eff85c790c83b')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm655 "$srcdir/$pkgname-$pkgver/assets/$pkgname.desktop" "$pkgdir/usr/share/applications/moe.launcher.$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/assets/images/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/moe.launcher.$pkgname.png"
	sed -i 's/Exec=AppRun/Exec=sleepy-launcher/g' "$pkgdir/usr/share/applications/moe.launcher.$pkgname.desktop"
	sed -i 's/Icon=icon/Icon=moe.launcher.sleepy-launcher/g' "$pkgdir/usr/share/applications/moe.launcher.$pkgname.desktop"
	echo "StartupWMClass=moe.launcher.sleepy-launcher" >> "$pkgdir/usr/share/applications/moe.launcher.$pkgname.desktop"
}
