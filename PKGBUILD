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
pkgver=46.0.1
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
    sha512sums=('d547f53e6693e48c3ecba27e0fe4a56f552a69e12df37868e6e16d8f6b9e99dca936651ea828192bb3370685a00479eb8047300eb8b33b368e702eeb5b4400df')
else
    sha512sums=('c1b29cdecebccda54a013d0d36c710836cf90616770bfadbb74640cae4c5c8e9c20260cfc15d1bb0d9d17257bbd85aa1ee5e4614e6d2a1b613087f3656f5a773')
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
  
	sed -i -e 's/firefox/iceweasel/' "$srcdir/install.rdf"
	sed -i 's|Firefox|Iceweasel|
         ' "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/sourceeditor.properties" \
           "$srcdir/browser/chrome/$_lang/locale//$_lang/devtools/client/toolbox.dtd" \
           "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/webide.dtd" \
           "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/webide.properties"
	rm -rv "$srcdir/chrome/$_lang/locale/$_lang/global-platform"/{mac,win}

	zip -r "langpack-$_lang@iceweasel.mozilla.org.xpi" .
	install -vDm644 "langpack-$_lang@iceweasel.mozilla.org.xpi" "$pkgdir/usr/lib/iceweasel/browser/extensions/langpack-$_lang@iceweasel.mozilla.org.xpi"
}
