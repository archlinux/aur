# Maintainer: Asuka Minato
# Maintainer: Kid <hi at xuann dot wang>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app-electron
pkgver=2.2.4
pkgrel=5
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
	gendesk
)
install=.install

source=(
	"https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe"
	https://github.com/WiseLibs/better-sqlite3/releases/download/v9.0.0/better-sqlite3-v9.0.0-electron-v116-linux-x64.tar.gz
	notion.svg::https://api.iconify.design/logos/notion-icon.svg
	notion-app
)
sha256sums=('ba18604307593e8bfa4f90d1bc6cee56f3434e41f8d5a3edfc998277bd5ee18d'
            '38848d85c41116b419b13818ab934d6ec5c5c563f9623f1cf8a958809ea92c7d'
            '8c754365934a6b576104cdc41422cae01ff10f97d5513bb7a011aa73905d5c84'
            'd95b5cd37b59dcabe63520b0e2a27a2de3cb950fcc56b30ae3076e99ed6d4747')

prepare() {
	asar e "$srcdir/resources/app.asar" "$srcdir/unpacked"

	sed -i 's/"win32"===process.platform/true/g' "$srcdir/unpacked/.webpack/main/index.js"

	gendesk -f \
		--pkgname notion \
		--genericname 'Wiki, docs & projects' \
		--exec 'notion-app %U' \
		--categories Office \
		--mimetypes x-scheme-handler/notion
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
	install -Dm644 "$srcdir/notion.svg" -t "$share/icons/hicolor/scalable/apps"
	find $pkgdir -name "*test*" -path "*/node_modules/*" -print -delete
	find $pkgdir -type d -empty -delete
}
