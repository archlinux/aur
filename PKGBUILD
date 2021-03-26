# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2020
pkgver=2020.4.0
pkgrel=1
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('x86_64')
url="https://www.qoppa.com/pdfstudioviewer"
license=('custom')
depends=('java-runtime=8' 'sane')
source=("${pkgname}-${pkgver}_linux64.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux64.deb"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('a9339a3b5383bc413b2e53b4a0e1f17404a3f894685fa5d78a0b3153c7b83e00'
            '531354a4fe61e8b16ad3123cd49df7140d4ac1ef3c5e75520b9250d55c398481'
            'eb17f775395167664d3bb22dc0f0ba54a6ba9fa975c2a1076716090a8e9a39aa')

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
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
