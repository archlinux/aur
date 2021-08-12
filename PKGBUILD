# Maintainer: chayleaf <chayleaf@protonmail.com>
# Contributor: Artemii Sudakov <finziyr@yandex.ru>

pkgname="freezer-electron-git"
_pkgname="freezer"
pkgver="1.1.24"
pkgrel="1"
pkgdesc='Freezer (Free client for Deezer) using the system provided electron.'
arch=('x86_64')
url="https://git.freezer.life/exttex/freezerpc"
provides=(freezer)
conflicts=(freezer-git freezer-appimage freezer-bin)
license=('GPL3')
depends=('openssl' 'libnotify' 'libxtst' 'nss' 'electron')
makedepends=('npm' 'git' 'sed')
source=("${_pkgname}::git+https://git.freezer.life/exttex/freezerpc.git"
	"freezer.desktop")
sha512sums=("SKIP"
	    "1fd1323efa485ebd56087b2ed799f9b1452cd7bb03e398fce561eb3321bc7af149c22c02a5e7360f814b4cf790c88c3792ec970e6f25f0f49d073381accdddff")
pkgver() {
	cd "$srcdir/$_pkgname"
	grep '"version":.*' package.json | cut -d '"' -f 4
}
build() {
	cd "$srcdir/$_pkgname"
	sed -e '/"target": \[/,/\].*/{//!d}' -i package.json
	sed '/^[[:blank:]]*"target": \[/a "dir"' -i package.json
	npm i
	npm run build
}
package() {
	mkdir -p "$pkgdir/usr/lib"
	echo "A"
	cp -r "$srcdir/$_pkgname/dist/linux-unpacked/resources" "$pkgdir/usr/lib/freezer"
	cd "$srcdir/$_pkgname/build/iconset"
	for size in 128 256 512; do
		install -Dm644 ${size}x${size}.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/freezer.png"
	done
	install -Dm755 "$srcdir/freezer.desktop" "$pkgdir/usr/share/applications/freezer.desktop"
	echo "#!/bin/sh" > "$srcdir/$_pkgname.sh"
	echo "exec electron /usr/lib/$_pkgname/app.asar \$@" >> "$srcdir/$_pkgname.sh"
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
