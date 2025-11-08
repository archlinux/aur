# Maintainer: aeris <aeris+aur@imirhil.fr>
pkgname=website-auditing-tool
pkgver=2.0.0
pkgrel=1
gitversion=$pkgver
#gitversion=2.0.0
pkgdesc="Tool to collect evidence, analyse them and generate reports regarding trackers that are being used by websites. It is intended to be used to facilitate website inspections."
arch=(any)
url="https://code.europa.eu/edpb/website-auditing-tool"
license=(EUPL-1.2)
depends=()
makedepends=(patch git nodejs npm typescript)
source=(
	"website-auditing-tool::git+https://code.europa.eu/edpb/website-auditing-tool.git/#tag=$gitversion"
	electron-disable-deb.patch
	"$pkgname.desktop"
)
sha256sums=('4b8c3ad633c171696bbdd1e4a30821101473a0addd20f225e198d2f88b220380'
            'b97f2bcdcd9d4445d02486783e39ae09deea3c441bb97a0b09e809d649b59ff0'
            '6e7c6ee07e476996b72e9ad51dbe5d8515c2be853204b1d35bd83d857fe19392')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p 1 < "$srcdir/electron-disable-deb.patch"
}

build() {
	cd "$srcdir/$pkgname"
	npm install --legacy-peer-deps
	npm run electron:linux
}

package() {
	cd "$srcdir/$pkgname/releases/linux-unpacked/"
	install -Dm 755 website-audit -t "$pkgdir/opt/$pkgname/"
	install -Dm 644 chrome_100_percent.pak icudtl.dat libffmpeg.so resources.pak v8_context_snapshot.bin -t "$pkgdir/opt/$pkgname/"
	install -Dm 644 resources/app.asar -t "$pkgdir/opt/$pkgname/resources/"

	cd "$srcdir/$pkgname/resources/icons/"
	for res in 16 24 32 48 64 96 128 256 512; do
		res="${res}x${res}"
		install -Dm 644 "$res.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
	done

	install -Dm 644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm 644 "$srcdir/$pkgname/LICENSES/$license.txt" "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}
