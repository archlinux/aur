# Maintainer: Artemii Sudakov <finziyr@yandex.ru>

pkgname="freezer-git"
pkgver="1.1.19"
pkgrel="1"
pkgdesc='Free music streaming client for Deezer based on the Deezloader/Deemix "bug".'
arch=('x86_64')
url="https://git.freezer.life/exttex/freezerpc"
license=('GPL3')
depends=()
makedepends=('npm' 'git' 'sed')
source=("${pkgname}::git+https://git.freezer.life/exttex/freezerpc.git"
	"freezer.desktop")
sha512sums=("SKIP"
	    "1fd1323efa485ebd56087b2ed799f9b1452cd7bb03e398fce561eb3321bc7af149c22c02a5e7360f814b4cf790c88c3792ec970e6f25f0f49d073381accdddff")
pkgver() {
	cd "$srcdir/$pkgname"
	grep '"version":.*' package.json | cut -d '"' -f 4
}
build() {
	cd "$srcdir/$pkgname"
	sed 's/"AppImage"/"dir"/g' -i package.json 
	npm i
	npm run build
}
package() {
	cd "$srcdir/$pkgname/dist/linux-unpacked"
	mkdir -p "$pkgdir/opt/exttex/freezer"
	mv * "$pkgdir/opt/exttex/freezer"
	cd "$srcdir/$pkgname/build/iconset"
	for size in 128 256 512; do
		install -Dm644 ${size}x${size}.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/freezer.png"
	done
	install -Dm755 "$srcdir/freezer.desktop" "$pkgdir/usr/share/applications/freezer.desktop"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/exttex/freezer/freezer" "$pkgdir/usr/bin/freezer"
	echo "
	>>> For some reason, after the update, the freezer overwrites ~/.config/freezer
	>>> Make a backup copy of this directory, and after running the updated version, return it to its place.
	"
}
