# Maintainer: Artemii Sudakov <finziyr@yandex.ru>

pkgname="freezer-git"
pkgver="1.1.11"
pkgrel="1"
pkgdesc='Free music streaming client for Deezer based on the Deezloader/Deemix "bug".'
arch=('x86_64')
url="https://git.rip/freezer/freezerpc"
license=('custom')
depends=('fuse2' 'zlib')
makedepends=('npm')
source=("${pkgname}::git+https://git.rip/freezer/freezerpc.git"
	"freezer.desktop")
sha512sums=("SKIP"
	    "7daafb47ab2d64dfc1a87e7faa9b39a37910f8838842237d01c9c245aa68638e25a781619fe334bb9fe828fd04b0a918c44eecd3d645ae72009452926971e7ba")
pkgver() {
	cd "$srcdir/$pkgname"
	grep '"version":.*' package.json | cut -d '"' -f 4
}
build() {
	cd "$srcdir/$pkgname"
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
}
