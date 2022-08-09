# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bruce Zhang

pkgname=electron-fiddle
_pkgname=fiddle
pkgver=0.29.2
pkgrel=5
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
depends=('electron')
makedepends=('npm')
provides=("$pkgname" "$pkgname")
source=("$_pkgname-$pkgver.src.tar.gz::https://github.com/electron/fiddle/archive/v$pkgver.tar.gz")
sha256sums=('79743a1631c602697272c053ea60086f89fb3deccdea44b2767a8962e57fa376')

prepare() {
	local cache="$srcdir/npm-cache"
	local dist="/usr/lib/electron"

	cd "$srcdir/$_pkgname-$pkgver"

	# Fix dependencies
 	#sed -i 's#"monaco-editor": "^0.21.3"#"monaco-editor": "^0.21.0"#' "package.json"

	# Workaround for Husky error
	mkdir .git
	
	npm install --cache "$cache"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	npm run package
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/out/Electron Fiddle-linux-x64/resources"
	install -Dm644 app.asar "$pkgdir/usr/lib/electron-fiddle/app.asar"

	cd "$srcdir/$_pkgname-$pkgver/assets/icons"
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
	install -Dm644 $srcdir/$_pkgname-$pkgver/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
