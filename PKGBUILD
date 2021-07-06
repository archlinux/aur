# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2021
pkgver=2021.0.1
pkgrel=1
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('x86_64')
url="https://www.qoppa.com/pdfstudioviewer"
license=('custom')
depends=('java-runtime' 'sane')
source=("${pkgname}-${pkgver}_linux64.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux64.deb"
        "$pkgname.desktop")
sha256sums=('8dbf2528b0c6db103da21828bc697288bdc3af31756ff550385baf5ebff2587a'
            '6220630a14643d9052da65fb67bf8e841790e7c6e25e79dd4c297556d2c478b3')

prepare() {
	mkdir -p "$pkgname-$pkgver"
	bsdtar xf data.tar.gz -C "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	bsdtar xf "opt/$_pkgname/lib/pdfstudio.jar" resources/license.html

	# Remove bundled JRE
	rm -rf "opt/$_pkgname/jre"
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/opt/$pkgname"
	cp -r "opt/$_pkgname/." "$pkgdir/opt/$pkgname/"

	install -Dm644 "opt/$_pkgname/.install4j/$_pkgname.png" \
		"$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 resources/license.html -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
