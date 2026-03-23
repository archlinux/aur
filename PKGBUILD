# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=anime-games-launcher
pkgver=2.0.0
pkgrel=2
pkgdesc="Universal linux launcher for anime games"
arch=('x86_64')
url="https://github.com/an-anime-team/anime-games-launcher"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glibc' 'hicolor-icon-theme' 'glib2'
	 'pango' 'cairo' 'libstdc++' 'libgcc' 'wayland' 'git'
	 'unzip' '7zip')
makedepends=('cargo')
optdepends=(
	 'mangohud: FPS Overlay'
	 'gamescope: Micro-Compositor'
	 'gamemode: CPU Scaling Control')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d50894a351b56be0e7eaaa2f1d76466edd2fa718d494276649145eb739e8f61')

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
	export CXXFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "target/release/anirun" "$pkgdir/usr/bin/anirun"
	install -Dm644 "crates/$pkgname/assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "crates/$pkgname/assets/images/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/moe.launcher.$pkgname.png"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	ln -s "/usr/share/icons/hicolor/512x512/apps/moe.launcher.$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	sed -i "s/Exec=AppRun/Exec=$pkgname/g" "$pkgdir/usr/share/applications/$pkgname.desktop"
	sed -i "s/Icon=icon/Icon=$pkgname/g" "$pkgdir/usr/share/applications/$pkgname.desktop"
	echo "StartupWMClass=moe.launcher.$pkgname" >> "$pkgdir/usr/share/applications/$pkgname.desktop"
}
