pkgname=antsword
pkgver=2.1.16
pkgrel=4
pkgdesc="Cross-platform webshell management toolkit."
arch=('any')
url="https://github.com/AntSwordProject/antSword"
license=('MIT')
depends=('electron4-bin' 'bash' 'hicolor-icon-theme')
makedepends=('desktop-file-utils')
source=("https://github.com/AntSwordProject/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-$pkgver.patch"
        "$pkgname.desktop"
        "32x32.png"
        "256x256.png"
        "$pkgname")
sha256sums=("ffd46a79be7f48b0fbfdaf5e6aee9f414259c126138f83c462aeb96ba1785110"
        "fa236bb4e08f1bd11d077969b9089961a374595dd21b62925e3830b892d375bc"
        "f3cff3ac504b8ff4bd48c9086e49ae978b6f13a3a60dc80b4dfca584c6995f69"
        "3bcb41a20284d0ad9a6f241c21587164817501a403c1536037a25423602bee88"
        "1c30320dc9fdc31535adb3a72a84e51841eae54659132b3baab1ae782581af8c"
        "65c63921e12780a68c2fac7183d6dd054a44452743c73c45e66c9e18d3952826")

prepare() {
	# Regulate package dir name
	find . -depth -type d -iname "$pkgname-$pkgver" -exec mv {} "$pkgname-$pkgver" \;

	cd "$pkgname-$pkgver"
	# Patch out blacklist
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

package() {
	# Place files
	install -d "$pkgdir/usr/lib"
	cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/lib/$pkgname"

	# Place license
	install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Place launcher script
	install -Dm 755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

	# Place desktop entry and icon
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
	local res
	for res in 32x32 256x256; do
		install -DT "$srcdir/$res.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
	done
}
