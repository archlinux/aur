# Maintainer: Kimiblock Moe
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=an-anime-game-launcher-bwrap
pkgver=3.13.0
pkgrel=1
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
arch=('x86_64')
url="https://github.com/an-anime-team/an-anime-game-launcher"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'glib2'
	 'pango' 'xz' 'bzip2' 'cairo' 'p7zip' 'portable')
makedepends=('cargo')
optdepends=(
	 'mangohud: FPS Overlay'
	 'gamescope: Micro-Compositor'
	 'gamemode: CPU Scaling Control')
source=("$url/archive/refs/tags/${pkgver}.tar.gz"
	"portable-config"
	"start.sh")
sha256sums=('e1a69cc1fd8a4fc7ec087ab705496245890138ec15015689b88d20e5ec74bd82'
            '36dfa9fef68f90e2baf6361cf42c99880d985a3bc8249c15ef14ca87adde0dee'
            '4895bf6a6bd4297cfb8a51e01ed39cd0e7a6e17fd96a83a06b581138c4443e4b')

prepare() {
	cd "$srcdir/an-anime-game-launcher-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/an-anime-game-launcher-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
    	cargo build --frozen --release --target-dir target
}

package() {
	cd "$srcdir/an-anime-game-launcher-$pkgver"
	install -Dm755 "target/release/anime-game-launcher" "$pkgdir/usr/bin/an-anime-game-launcher"
	install -Dm644 "assets/anime-game-launcher.desktop" "$pkgdir/usr/share/applications/an-anime-game-launcher.desktop"
	install -Dm644 "assets/images/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/moe.launcher.an-anime-game-launcher.png"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	ln -s "/usr/share/icons/hicolor/512x512/apps/moe.launcher.an-anime-game-launcher.png" "$pkgdir/usr/share/pixmaps/an-anime-game-launcher.png"
	sed -i 's/Exec=AppRun/Exec=an-anime-game-launcher-bwrap/g' "$pkgdir/usr/share/applications/an-anime-game-launcher.desktop"
	sed -i 's/Icon=icon/Icon=an-anime-game-launcher/g' "$pkgdir/usr/share/applications/an-anime-game-launcher.desktop"
	echo "StartupWMClass=moe.launcher.an-anime-game-launcher" >> "$pkgdir/usr/share/applications/an-anime-game-launcher.desktop"
	echo "X-Flatpak-Tags=Games;" >> "$pkgdir/usr/share/applications/an-anime-game-launcher.desktop"
	echo "X-Flatpak=moe.launcher.an-anime-game-launcher" >> "$pkgdir/usr/share/applications/an-anime-game-launcher.desktop"
	install -Dm755 "$srcdir/portable-config" "$pkgdir/usr/lib/portable/info/moe.launcher.an-anime-game-launcher/config"
	install -Dm755 "$srcdir/start.sh" "$pkgdir/usr/bin/an-anime-game-launcher-bwrap"
}
