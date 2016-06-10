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
pkgver=47.0
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
    sha512sums=('4a9e9527173e9a99462e421d5289a93df37d104863e0fd837fd7d7d8339dde3ec7f86972fc5b04469b8e15ead8c4f8e2d83e43e10dca21be86920cd7b769762e')
else
    sha512sums=('eef616b6da4ddea2e830952dd583edb1aaac5d798bb06bf45efb6c0fbfbadcb788be0341fd1c1c9ff4aee42c0e6934634c067434763ef629644090b85950e85e')
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
