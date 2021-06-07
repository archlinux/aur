# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('drill-search-cli' 'drill-search-gtk')
pkgbase=drill-search
pkgver=566
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling"
arch=('x86_64')
url="https://drill.software"
license=('GPL2')
makedepends=('dmd' 'dub' 'gtk3')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/yatima1460/Drill/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgbase"
        "$pkgbase-gtk.desktop")
sha256sums=('d003fa60543830fdfd0ab08cb67d8ac4b943707c0ab060f9ceaaf2b09dc9dad8'
            'b875f928546aee7855cb1db9afc8ab3f1a8a34d43de5bbd62f7076d7ba9f3917'
            '5bafb37baf608a3168abba2ab9ea174a1d0f0472f52d3222ea0a05957c997c50')

build() {
	cd "Drill-$pkgver"
	echo "$pkgver" > DRILL_VERSION
	dub build -b release -c CLI --force --parallel --verbose --arch="$CARCH"
	dub build -b release -c GTK --force --parallel --verbose --arch="$CARCH"
}

package_drill-search-cli() {
	pkgdesc+=" (CLI version)"

	cd "Drill-$pkgver/Build/Drill-CLI-linux-$CARCH-release"
	install -d "$pkgdir/"{opt/$pkgname,usr/bin}
	cp -r Assets "$pkgdir/opt/$pkgname"
	install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgbase" "$pkgdir/usr/bin/$pkgname"
	echo "/opt/$pkgname/$pkgname" "\$@" >> "$pkgdir/usr/bin/$pkgname"
}

package_drill-search-gtk() {
	pkgdesc+=" (GTK version)"
	depends=('gtk3' 'xdg-utils')

	cd "Drill-$pkgver/Build/Drill-GTK-linux-$CARCH-release"
	install -d "$pkgdir/"{opt/$pkgname,usr/bin}
	cp -r Assets "$pkgdir/opt/$pkgname"
	install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgbase" "$pkgdir/usr/bin/$pkgname"
	echo "/opt/$pkgname/$pkgname" "\$@" >> "$pkgdir/usr/bin/$pkgname"
	install -Dm644 Assets/icon.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm644 "$srcdir/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
}
