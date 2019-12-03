# Maintainer: Bruce Zhang
pkgname=electron-fiddle
_name=fiddle
pkgver=0.11.1
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64')
url="https://electronjs.org/fiddle"
license=('MIT')
depends=('electron')
makedepends=('npm')
provides=('electron-fiddle')
source=("$_name-$pkgver.src.tar.gz::https://github.com/electron/fiddle/archive/v$pkgver.tar.gz")
sha256sums=('e0452b4581afe40a3179b358d8d3e90dd13a3faf6a1382068136cf0361c09da2')

prepare() {
	local cache="$srcdir/npm-cache"
	local dist="/usr/lib/electron"

	cd "$srcdir/$_name-$pkgver"
	npm install --cache "$cache"
}

build() {
	cd "$srcdir/$_name-$pkgver"
	npm run package
}

package() {
	cd "$srcdir/$_name-$pkgver/out/Electron Fiddle-linux-x64/resources"
	install -Dm644 app.asar "$pkgdir/usr/lib/electron-fiddle/app.asar"

	cd "$srcdir/$_name-$pkgver/assets/icons"
	install -Dm644 fiddle.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/electron-fiddle.svg"

	cd "$srcdir"
	echo "#!/bin/env sh
exec electron /usr/lib/electron-fiddle/app.asar \$@
" > electron-fiddle.sh
	install -Dm755 electron-fiddle.sh "$pkgdir/usr/bin/electron-fiddle"

	echo "[Desktop Entry]
Name=Electron Fiddle
Comment=The easiest way to get started with Electron
GenericName=Electron Fiddle
Exec=electron-fiddle %U
Icon=electron-fiddle
Type=Application
StartupNotify=true
Categories=GNOME;GTK;Utility;
" > electron-fiddle.desktop
	install -Dm755 electron-fiddle.desktop "$pkgdir/usr/share/applications/electron-fiddle.desktop"
}
