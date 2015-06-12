# Maintainer: Evert Van Petegem <evert.van.petegem@gmail.com>
pkgname=pwsafe-gui
pkgver=0.95.1BETA
pkgrel=3
pkgdesc="A GUI password manager from cryptologist Bruce Schneier"
arch=('i686' 'x86_64')
url="http://passwordsafe.sourceforge.net/index.shtml"
license=('Artistic2.0')
depends=('libxtst' 'wxgtk' 'xerces-c' 'ykpers' 'webkitgtk2')
makedepends=('libxt' 'zip')
conflicts=('pwsafe' 'passwordsafe-debian' 'passwordsafe-git')
validpgpkeys=('A703C1328EABC7B201753BA3919464515CCF8BB3')
source=("http://downloads.sourceforge.net/project/passwordsafe/Linux-BETA/${pkgver%BETA}/pwsafe-$pkgver-src.tgz"{,.sig})
md5sums=('e3e3429d08789b6bde6270d1e6a91608'
         'SKIP')

build() {
	cd "$srcdir/pwsafe-$pkgver"
	make release I18N help
}

package() {
	install -Dm755 "$srcdir/pwsafe-$pkgver/src/ui/wxWidgets/GCCUnicodeRelease/pwsafe" "$pkgdir/usr/bin/pwsafe"
	install -Dm644 "$srcdir/pwsafe-$pkgver/install/desktop/pwsafe.desktop" "$pkgdir/usr/share/applications/pwsafe.desktop"
	install -Dm644 "$srcdir/pwsafe-$pkgver/install/graphics/pwsafe.png" "$pkgdir/usr/share/pixmaps/pwsafe.png"
	mkdir -p "$pkgdir/usr/share/pwsafe/xml"
	mkdir -p "$pkgdir/usr/share/doc/passwordsafe/help"
	mkdir -p "$pkgdir/usr/share/man/man1"
	mkdir -p "$pkgdir/usr/share/locale"
	cp "$srcdir/pwsafe-$pkgver/README.txt" "$srcdir/pwsafe-$pkgver/docs/ReleaseNotes.txt" "$srcdir/pwsafe-$pkgver/docs/ChangeLog.txt" "$pkgdir/usr/share/doc/passwordsafe"
	cat "$srcdir/pwsafe-$pkgver/install/copyright" "$srcdir/pwsafe-$pkgver/LICENSE" > "$pkgdir/usr/share/doc/passwordsafe/copyright"
	mv "$pkgdir/usr/share/doc/passwordsafe/ChangeLog.txt" "$pkgdir/usr/share/doc/passwordsafe/changelog"
	(cd "$pkgdir/usr/share/doc/passwordsafe"; gzip -9 changelog)
	cp "$srcdir/pwsafe-$pkgver/docs/pwsafe.1" "$pkgdir/usr/share/man/man1"
	gzip -9 "$pkgdir/usr/share/man/man1/pwsafe.1"
	cp "$srcdir/pwsafe-$pkgver/xml/pwsafe.xsd" "$srcdir/pwsafe-$pkgver/xml/pwsafe_filter.xsd" "$srcdir/pwsafe-$pkgver/xml/pwsafe.xsl" "$srcdir/pwsafe-$pkgver/xml/KPV1_to_PWS.xslt" "$pkgdir/usr/share/pwsafe/xml"
	cp -r "$srcdir"/pwsafe-$pkgver/help/* "$pkgdir/usr/share/doc/passwordsafe/help"
	cp -r "$srcdir/pwsafe-$pkgver/src/ui/wxWidgets/I18N/mos"/* "$pkgdir/usr/share/locale"
	cp "$srcdir/pwsafe-$pkgver/install/desktop/pwsafe.desktop" "$srcdir/pwsafe-$pkgver/install/graphics/pwsafe.png" "$pkgdir/usr/share/pwsafe"
	find "$pkgdir" -type d -exec 'chmod' 755 '{}' \;
	chmod -R g-w "$pkgdir/usr/share/pwsafe"
	chmod -R g-w "$pkgdir/usr/share/doc/passwordsafe"/*
	chmod g-w "$pkgdir/usr/share/man/man1/pwsafe.1.gz"
}
