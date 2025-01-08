# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=electron-fiddle-git
_pkgname=fiddle
pkgver=r2073.9eb162c
pkgrel=2
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64')
url="https://electronjs.org/fiddle"
license=('MIT')
depends=('electron33')
makedepends=('npm' 'git')
provides=("electron-fiddle")
conflicts=('electron-fiddle' 'electron-fiddle-bin')
source=("git+https://github.com/electron/fiddle.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	local cache="$srcdir/npm-cache"
	local dist="/usr/lib/electron"

	cd "$srcdir/$_pkgname"
	export HOME="$srcdir/.electron-gyp"
	npm install --force --cache "$cache"
}

build() {
	cd "$srcdir/$_pkgname"
	export HOME="$srcdir/.electron-gyp"
	npm run package
}

package() {
	export HOME="$srcdir/.electron-gyp"

	cd "$srcdir/$_pkgname/out/Electron Fiddle-linux-x64/resources"
	install -Dm644 app.asar "$pkgdir/usr/lib/electron-fiddle/app.asar"

	cd "$srcdir/$_pkgname/assets/icons"
	install -Dm644 fiddle.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/electron-fiddle.svg"

	cd "$srcdir"
	echo "#!/bin/env sh
exec electron33 /usr/lib/electron-fiddle/app.asar \$@
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
MimeType=x-scheme-handler/electron-fiddle;
Categories=GNOME;GTK;Utility;
" > electron-fiddle.desktop
	install -Dm755 electron-fiddle.desktop "$pkgdir/usr/share/applications/electron-fiddle.desktop"
	install -Dm644 $srcdir/$_pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
