# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('drill-search-cli' 'drill-search-gtk')
pkgbase=drill-search
pkgver=2.1.1
pkgrel=6
arch=('x86_64')
url="https://drill.software"
license=('GPL2')
makedepends=('dmd' 'dub')
install="$pkgbase.install"
source=("$pkgbase-$pkgver.tar.gz::https://github.com/yatima1460/Drill/archive/$pkgver.tar.gz"
        "$pkgbase"
        "$pkgbase-gtk.desktop")
sha256sums=('ecd3a976e85210a21d0bb0082b490993d9c152c7b0b2183293e003a20b512d54'
            'b875f928546aee7855cb1db9afc8ab3f1a8a34d43de5bbd62f7076d7ba9f3917'
            '5bafb37baf608a3168abba2ab9ea174a1d0f0472f52d3222ea0a05957c997c50')

build() {
    cd "Drill-$pkgver"
    dub build --parallel -b release -c CLI
    dub build --parallel -b release -c GTK
}

package_drill-search-cli() {
	pkgdesc="Search files without indexing, but clever crawling (CLI version)"

	cd "Drill-$pkgver/Build/Drill-CLI-linux-$arch-release"
	install -d "$pkgdir/"{opt/$pkgname,usr/bin}
	cp -r Assets "$pkgdir/opt/$pkgname"
	install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgbase" "$pkgdir/usr/bin/$pkgname"
	echo "/opt/$pkgname/$pkgname" "\$@" >> "$pkgdir/usr/bin/$pkgname"
}

package_drill-search-gtk() {
	pkgdesc="Search files without indexing, but clever crawling (GTK version)"
	depends=('gtk3' 'xdg-utils')

	cd "Drill-$pkgver/Build/Drill-GTK-linux-$arch-release"
	install -d "$pkgdir/"{opt/$pkgname,usr/bin}
	cp -r Assets "$pkgdir/opt/$pkgname"
	install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgbase" "$pkgdir/usr/bin/$pkgname"
	echo "/opt/$pkgname/$pkgname" "\$@" >> "$pkgdir/usr/bin/$pkgname"
	install -Dm644 Assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
