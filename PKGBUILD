# Maintainer: Asuka Minato
# Maintainer: Kid <hi at xuann dot wang>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app-electron
pkgver=3.1.0
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
	electron
)
makedepends=(
	asar
	icoutils
)
install=.install

source=(
	"https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe"
	https://github.com/WiseLibs/better-sqlite3/releases/download/v9.2.2/better-sqlite3-v9.2.2-electron-v116-linux-x64.tar.gz
	notion-app
	notion.desktop
)
sha256sums=('d8027c86503ff050c4eb988c7c12936002968a704c069b9d5932ca5e971d66f2'
            '973f1cd3b1803ce6a3be74c87edae1cdb3fba603efba9a4f68673a8288b6c5c7'
            'd95b5cd37b59dcabe63520b0e2a27a2de3cb950fcc56b30ae3076e99ed6d4747'
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
