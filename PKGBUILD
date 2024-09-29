# Maintainer: aeris <aeris+aur@imirhil.fr>
pkgname=website-auditing-tool
pkgver=1.2.5
pkgrel=1
pkgdesc="Tool to collect evidence, analyse them and generate reports regarding trackers that are being used by websites. It is intended to be used to facilitate website inspections."
arch=(any)
url="https://code.europa.eu/edpb/website-auditing-tool"
license=(EUPL-1.2)
depends=()
makedepends=(git nodejs npm typescript)
source=(
	"website-auditing-tool::git+https://code.europa.eu/edpb/website-auditing-tool.git/#tag=$pkgver"
	electron-disable-deb.patch
	"$pkgname.desktop"
)
sha256sums=('d9453206ca522e7944a1df7dbd592260eb05334e724a6d82833db4fe451588fc'
            '3ecbc420f21302ec48f5ef6e357bbb5ef4c0ffc195a76235505c62fafd595816'
            '6e7c6ee07e476996b72e9ad51dbe5d8515c2be853204b1d35bd83d857fe19392')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p 1 < "$srcdir/electron-disable-deb.patch"
}

build() {
	cd "$srcdir/$pkgname"
	npm install
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
