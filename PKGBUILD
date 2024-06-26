# Maintainer: aeris <aeris+aur@imirhil.fr>
pkgname=website-auditing-tool
pkgver=1.2.4
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
sha256sums=('1a641a0923f8b98912c108c9254a738ad8ea4e782148860cf746baf2a9d33b96'
            '63d6da56c80f29ab0b6cfd4d148734c5c29e740731fda5de64e26e61d2ff7ea9'
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
	install -Dm 755 website-audit -t "$pkgdir/opt/$name/"
	install -Dm 644 chrome_100_percent.pak icudtl.dat libffmpeg.so resources.pak v8_context_snapshot.bin -t "$pkgdir/opt/$name/"
	install -Dm 644 resources/app.asar -t "$pkgdir/opt/$name/resources/"

	cd "$srcdir/$pkgname/resources/icons/"
	for res in 16 24 32 48 64 96 128 256 512; do
		res="${res}x${res}"
		install -Dm 644 "$res.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
	done

	install -Dm 644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm 644 "$srcdir/$pkgname/LICENSES/$license.txt" "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}
