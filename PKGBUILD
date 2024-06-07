# Maintainer: aeris <aeris+aur@imirhil.fr>
pkgname=website-auditing-tool
pkgver=1.2.3
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
	doh.patch
)
sha256sums=('e0d78162e800e2e2b259e0b1bd4dd1bdad3f51d6c168ff8592a1db3ea28de4d8'
            'c08c969fdba6868729cf7c39abd7b797f52cd36391666df1509cd7576f6e558e'
            '6e7c6ee07e476996b72e9ad51dbe5d8515c2be853204b1d35bd83d857fe19392'
            '45df5f5bb7fea00a0f15ed6ba92f67e75347fee7f5232377d283c93064266710')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p 1 < "$srcdir/electron-disable-deb.patch"
	patch -p 1 < "$srcdir/doh.patch"
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
