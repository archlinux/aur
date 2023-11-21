# Maintainer: Asuka Minato
# Maintainer: Kid <hi at xuann dot wang>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app-electron
pkgver=2.3.2
pkgrel=2
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
	https://github.com/WiseLibs/better-sqlite3/releases/download/v9.0.0/better-sqlite3-v9.0.0-electron-v116-linux-x64.tar.gz
	notion-app
	notion.desktop
)
sha256sums=('5e486d296bbba753061c9226415f632d53d20a9796e8a4dafe6a1ec79d38c362'
            '38848d85c41116b419b13818ab934d6ec5c5c563f9623f1cf8a958809ea92c7d'
            'd95b5cd37b59dcabe63520b0e2a27a2de3cb950fcc56b30ae3076e99ed6d4747'
            '6dc21c32bb47613c5af3a963bd1d1211a5ed3538c9dea4d83b07b239e96cf20c')

prepare() {
	asar e "$srcdir/resources/app.asar" "$srcdir/unpacked"
	icotool -x -w 256 "$srcdir/unpacked/icon.ico" -o "$srcdir/notion.png"

	sed -i -e 's/"win32"===process.platform/(true)/g
		    s/_.Store.getState().app.preferences?.isAutoUpdaterDisabled/(true)/g
		    s!extra-resources!/usr/share/icons/hicolor/256x256/apps!g
		    s/trayIcon.ico/notion.png/g' "$srcdir/unpacked/.webpack/main/index.js"
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
	find $pkgdir -name "*test*" -path "*/node_modules/*" -print -delete
	rm $pkgdir/usr/lib/notion-app/node_modules/node-addon-api/tools/{eslint-format.js,conversion.js,clang-format.js}
	find $pkgdir -type d -empty -delete
}
