# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bruce Zhang

pkgname=electron-fiddle
_pkgname=fiddle
pkgver=0.32.4
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
depends=('electron')
makedepends=('npm')
provides=("$pkgname" "$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$_pkgname-$pkgver.src.tar.gz::https://github.com/electron/fiddle/archive/v$pkgver.tar.gz")
sha256sums=('cc4f245557a41f34057f0ac4d6f5ef8df26f9452d424e9b3684d4b598990807f')

prepare() {
	local cache="$srcdir/npm-cache"
	local dist="/usr/lib/electron"

	cd "$srcdir/$_pkgname-$pkgver"

	# Workaround Husky error
	git init
	
	npm install --cache "$cache"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	npm run package
}

package() {
	# Install program
	cd "$srcdir/$_pkgname-$pkgver/out/Electron Fiddle-linux-x64/resources"
	install -Dm644 app.asar "$pkgdir/usr/lib/electron-fiddle/app.asar"

	# Install icon
	cd "$srcdir/$_pkgname-$pkgver/assets/icons"
	install -Dm644 fiddle.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/electron-fiddle.svg"

	# Install entry script
	cd "$srcdir"
	echo "#!/bin/env sh
exec electron /usr/lib/electron-fiddle/app.asar \$@
" > electron-fiddle.sh
	install -Dm755 electron-fiddle.sh "$pkgdir/usr/bin/electron-fiddle"

	# Install desktop file
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

	# Install LICENSE.md
	install -Dm644 $srcdir/$_pkgname-$pkgver/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
