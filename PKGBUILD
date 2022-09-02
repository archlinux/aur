# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron17
pkgname=revolt-desktop
pkgver=1.0.6
pkgrel=2
pkgdesc='User-first chat platform built with modern web technologies'
arch=(any)
url=https://revolt.chat
license=(AGPL3)
depends=("$_electron")
makedepends=(yarn)
source=("https://github.com/revoltchat/desktop/archive/v$pkgver.tar.gz"
				"https://raw.githubusercontent.com/revoltchat/desktop/master/LICENSE"
        "$pkgname.js")
sha256sums=('84c06e3924e53d3272f7c2be9832a259f710c75a7a36d2732c3cb7a0e119e366'
            '147078bfdb948f3ac5ff0e4bb97bd040b61fef4dd5fb8ff851ef333ff048caf9'
            '3a9ae188a92ca0620a0838b32e0ab4a38b1fcca4c313d9a1c933c469f8d60df0')

build() {
	cd "desktop-$pkgver"
	yarn
	yarn run build:bundle
	rm -r node_modules
	yarn plugin import workspace-tools
	yarn workspaces focus --production

	sed -i "s~@ELECTRON@~$_electron~" "$srcdir/$pkgname.js"
}

package() {
	cd "desktop-$pkgver"

	_appdir="/usr/lib/$pkgname"

	install -d "$pkgdir$_appdir"
	cp -r * "$pkgdir$_appdir"
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir$_appdir"

	install -Dm644 build/icons/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -Dm755 "$srcdir/$pkgname.js" "$pkgdir/usr/bin/$pkgname"

	install -d "$pkgdir/usr/share/applications"
	ln -s $(realpath -m --relative-to="/usr/share/applications" "$_appdir/$pkgname.desktop") "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ln -s $(realpath -m --relative-to="/usr/share/licenses/$pkgname" "$_appdir/LICENSE") "$pkgdir/usr/share/licenses/$pkgname"

	# Clean up
	rm -r "$pkgdir$_appdir/"{src,package,tsconfig.json,yarn.lock,"$pkgname.sh"}
	find "$pkgdir$_appdir" \
		-name ".*" -prune -exec rm -r '{}' \;
}
