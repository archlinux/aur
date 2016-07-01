# Maintainer: superlex


# Based on Parabola GNU/Linux-libre iceweasel-libre PKGBUILD :

# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Contributor: Figue <ffigue@gmail.com>

_lang=it
_language=Italian
_url=https://ftp.mozilla.org/pub/firefox/releases

pkgname=iceweasel-i18n-it
pkgver=47.0.1
pkgrel=1
pkgdesc="$_language language pack for Iceweasel"
arch=('any')
url="https://wiki.debian.org/it/Iceweasel"
license=('MPL' 'GPL')
#depends=("iceweasel>=$pkgver")
makedepends=('unzip' 'zip')
source=("$_url/$pkgver/linux-$CARCH/xpi/$_lang.xpi"
		'brand.dtd'
		'brand.properties')

if [ "$CARCH" = "x86_64" ]; then
    sha512sums=('3fef41c537c2bc6befc1d7320f808dec05c88856f3b8bf258a2a96bf23b0648b855f32709fd9a697c03fe859102b691f29584340dbead33bb4b9651ed212d219')
else
    sha512sums=('31d6528ce5599438c33ff12153c378997bf844d89473a7206091e7225fa601fe97fab93d533748bc2bf5fba78f7b0ff7662e1525923c92105a7fb2a41ae661ba')
fi

sha512sums+=('ce454355d904384381e35c390dbad634d617d17387debeb00b4e737a7b4fa665b94d40762a415236519b7a44f8b2066aeab9a50a34f1155c4b272e263ce19027'
          	 '1148215c777fde594362393751e9ac3c1a0c2cf6c87e1bb48bdea6eafd35ab027e357357ee8bdef143fae78c01471561724fe33ee86453ae2f36db3be2f52829')

package() {
	cd "$srcdir"
	rm "$_lang.xpi"
	install -vDm644 "$srcdir/brand.dtd" "$srcdir/browser/chrome/$_lang/locale/branding"
	rm "$srcdir/brand.dtd"
	install -vDm644 "$srcdir/brand.properties" "$srcdir/browser/chrome/$_lang/locale/branding"
	rm "$srcdir/brand.properties"
  
	#sed -i -e 's/firefox/iceweasel/' "$srcdir/install.rdf"
	#sed -i 's|Firefox|Iceweasel|
    #     ' "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/sourceeditor.properties" \
    #       "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/toolbox.dtd" \
    #       "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/webide.dtd" \
    #       "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/webide.properties"
	#rm -rv "$srcdir/chrome/$_lang/locale/$_lang/global-platform"/{mac,win}

	sed -i -e 's/firefox/iceweasel/' "$srcdir/install.rdf"
    sed -i 's|Firefox|Iceweasel|g' $(grep -rlI 'Firefox' "$srcdir")
    sed -i 's|Iceweasel|Firefox|' "$srcdir/chrome/$_lang/locale/$_lang/global/aboutRights.dtd"
	rm -rv "$srcdir/chrome/$_lang/locale/$_lang/global-platform"/{mac,win}

	zip -r "langpack-$_lang@iceweasel.mozilla.org.xpi" .
	install -vDm644 "langpack-$_lang@iceweasel.mozilla.org.xpi" "$pkgdir/usr/lib/iceweasel/browser/extensions/langpack-$_lang@iceweasel.mozilla.org.xpi"
}
