# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=electron-fiddle-git
_pkgname=fiddle
pkgver=0.29.0.r171.ga8862e14
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64')
url="https://electronjs.org/fiddle"
license=('MIT')
depends=('electron')
makedepends=('npm')
provides=("electron-fiddle")
source=("git+https://github.com/electron/fiddle.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #we cheat because tag somehow are not updated asthey should
  git describe --long --tags | sed 's/^v0.26.0/0.29.0/;s/\([^-]*-g\)/r\1/;s/-/./g'
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
MimeType=x-scheme-handler/electron-fiddle;
Categories=GNOME;GTK;Utility;
" > electron-fiddle.desktop
	install -Dm755 electron-fiddle.desktop "$pkgdir/usr/share/applications/electron-fiddle.desktop"
	install -Dm644 $srcdir/$_pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
