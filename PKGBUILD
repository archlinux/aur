# Maintainer: Asuka Minato
# Maintainer: Kid <hi at xuann dot wang>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

_name=notion
_path=notion-app
pkgname=$_path-electron
pkgver=2.2.4
pkgrel=4
pkgdesc='Your connected workspace for wiki, docs & projects'
arch=(x86_64)
url=https://www.notion.so/desktop
license=(custom)
depends=(
	electron
)
makedepends=(
	gendesk
)
install=.install

source=(
	https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe
	https://github.com/WiseLibs/better-sqlite3/releases/download/v9.0.0/better-sqlite3-v9.0.0-electron-v116-linux-x64.tar.gz
	$_name.svg::https://api.iconify.design/logos/notion-icon.svg
	$_path
)
sha256sums=('ba18604307593e8bfa4f90d1bc6cee56f3434e41f8d5a3edfc998277bd5ee18d'
            '38848d85c41116b419b13818ab934d6ec5c5c563f9623f1cf8a958809ea92c7d'
            '8c754365934a6b576104cdc41422cae01ff10f97d5513bb7a011aa73905d5c84'
            'ac0076b5b9352e17bdd670ba88d8a624b335721ea976a0cef04c0da4ec64d672')

prepare() {
	gendesk \
		--pkgname $_name \
		--comment 'Wiki, docs & projects' \
		--exec "$_path %U" \
		--categories Office \
		--mimetypes x-scheme-handler/notion
}

package() {
	local usr=$pkgdir/usr
	local share=$usr/share
	local lib=$usr/lib/$_path
	local resources=$lib/resources

	install -D --mode 644 $srcdir/resources/app.asar --target-directory $resources
	install -D --mode 644 $srcdir/build/Release/better_sqlite3.node --target-directory $resources/app.asar.unpacked/node_modules/better-sqlite3/build/Release

	install -D $_path --target-directory $usr/bin
	install -D --mode 644 $srcdir/$_name.desktop --target-directory $share/applications
	install -D --mode 644 $srcdir/$_name.svg --target-directory $share/icons/hicolor/scalable/apps
}
