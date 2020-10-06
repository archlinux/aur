# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2020
pkgver=2020.1.0
pkgrel=1
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('i686' 'x86_64')
url="https://www.qoppa.com/pdfstudioviewer"
license=('custom')
depends=('java-runtime=8' 'desktop-file-utils' 'sane')
source=("$pkgname.desktop"
        "$pkgname.sh")
source_i686=("${pkgname}-${pkgver}_linux.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux.deb")
source_x86_64=("${pkgname}-${pkgver}_linux64.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux64.deb")
sha256sums=('531354a4fe61e8b16ad3123cd49df7140d4ac1ef3c5e75520b9250d55c398481'
            '4b8c8711726bca47d41097862631168298fccece605222397ff0aa7b8765617c')
sha256sums_i686=('55badbdb6d8d7e2c10e90246aeb228cfcfcdf2507d4f4551dc7d323f1c2af590')
sha256sums_x86_64=('d139e02931249f9d11bb1a0bb0a7954ff974e1ffd5b35d0de4afae982706fafc')

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
	install -dm755 "$pkgdir/opt/$pkgname"
	cp -r "opt/$_pkgname/." "$pkgdir/opt/$pkgname/"

	install -Dm644 "opt/$_pkgname/.install4j/$_pkgname.png" \
		"$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 resources/license.html -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
