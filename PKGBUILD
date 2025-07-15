# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=an-anime-game-launcher
pkgver=3.15.0
pkgrel=1
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
arch=('x86_64')
url="https://github.com/an-anime-team/an-anime-game-launcher"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'glib2'
	 'pango' 'xz' 'bzip2' 'cairo' '7zip' 'openssl')
makedepends=('cargo')
optdepends=(
	 'mangohud: FPS Overlay'
	 'gamescope: Micro-Compositor'
	 'gamemode: CPU Scaling Control')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fbebd9a5490f76f6d5889305cee260d18cf3d82bb745d79a2f47714d0aefb9c0')

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
	install -Dm755 "target/release/anime-game-launcher" "$pkgdir/usr/bin/an-anime-game-launcher"
	install -Dm644 "assets/anime-game-launcher.desktop" "$pkgdir/usr/share/applications/moe.launcher.an-anime-game-launcher.desktop"
	install -Dm644 "assets/images/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/moe.launcher.an-anime-game-launcher.png"
	sed -i 's/Exec=AppRun/Exec=an-anime-game-launcher/g' "$pkgdir/usr/share/applications/moe.launcher.an-anime-game-launcher.desktop"
	sed -i 's/Icon=icon/Icon=moe.launcher.an-anime-game-launcher/g' "$pkgdir/usr/share/applications/moe.launcher.an-anime-game-launcher.desktop"
	echo "StartupWMClass=moe.launcher.an-anime-game-launcher" >> "$pkgdir/usr/share/applications/moe.launcher.an-anime-game-launcher.desktop"
}
