# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=an-anime-game-launcher
pkgver=3.17.0
pkgrel=2
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
arch=('x86_64')
url="https://github.com/an-anime-team/an-anime-game-launcher"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'glib2'
	 'pango' 'xz' 'bzip2' 'cairo' '7zip' 'openssl' 'libwebp-utils' 'git')
makedepends=('cargo')
optdepends=(
	 'mangohud: FPS Overlay'
	 'gamescope: Micro-Compositor'
	 'gamemode: CPU Scaling Control')
source=("$url/archive/refs/tags/${pkgver}.tar.gz"
	"libwebp.patch::$url/commit/36278d74e3e21db6a9aecaac5b09cb5afe38026c.diff")
sha256sums=('ca9fe42a53dc754fac07e58cc833dfd62a41bee5d76db2e12fb7442dc09a1dd5'
            '2a5f976ac0fb0513c03d7af1ddce8fdd40bc0456e1ffee7b6574d5303205cc9e')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 < "$srcdir/libwebp.patch"
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
