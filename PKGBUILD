# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
# Maintainer: Kid <hi at xuann dot wang>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app-electron
pkgver=3.1.1
pkgrel=1
pkgdesc='Your connected workspace for wiki, docs & projects'
arch=(x86_64)
url=https://www.notion.so/desktop
license=(custom)
depends=(
	bash
	gcc-libs
	glibc
	hicolor-icon-theme
	electron28
)
makedepends=(
	asar
	icoutils
)
install=.install

source=(
	"https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe"
	https://github.com/WiseLibs/better-sqlite3/releases/download/v9.2.2/better-sqlite3-v9.2.2-electron-v119-linux-x64.tar.gz
	notion-app
	notion.desktop
)
sha256sums=('b55742085cf723ea2d13dd6f97969b87329646028f540692fc8e070c16d49958'
            '9d9381dd7b53f06759916dbcfae24ede7e7e26c18ea45f00f40c35d4217ce7fb'
            '1ee5a3847a6aba3cba9b757ddc0f2364a5c24c4b63e057e03aede5c56f126642'
            '19a5f973f1e9291081aa05512e07c61447e8c30e1a43dd22d0cc1090837d1e19')

prepare() {
	asar e "$srcdir/resources/app.asar" "$srcdir/unpacked"
	icotool -x -w 256 "$srcdir/unpacked/icon.ico" -o "$srcdir/notion.png"
	icotool -x -w 256 "$srcdir/resources/trayIcon.ico" -o "$srcdir/trayIcon.png"

	sed -i -e 's/"win32"===process.platform/(true)/g
		    s/_.Store.getState().app.preferences?.isAutoUpdaterDisabled/(true)/g
		    s!extra-resources!/usr/share/notion-app!g
		    s/trayIcon.ico/trayIcon.png/g' "$srcdir/unpacked/.webpack/main/index.js"
}

package() {
	local usr="$pkgdir/usr"
	local share="$usr/share"
	local lib="$usr/lib/notion-app"

	install -d "$lib"
	cp -a "$srcdir/unpacked/"{package.json,node_modules,.webpack} "$lib"
	install -Dm644 "$srcdir/build/Release/better_sqlite3.node" -t "$lib/node_modules/better-sqlite3/build/Release/"
	install -Dm755 notion-app -t "$usr/bin"
	install -Dm644 "$srcdir/notion.desktop" -t "$share/applications"
	install -Dm644 "$srcdir/notion.png" -t "$share/icons/hicolor/256x256/apps"
	install -Dm644 "$srcdir/trayIcon.png" -t "$share/notion-app"
	find "$pkgdir" -type d -empty -delete
}
