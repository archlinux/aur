# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=gcs
pkgver=4.5.1
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
arch=('any')
url="http://gurpscharactersheet.com"
license=('MPL')
depends=('java-runtime=8')
source=(
	"http://gurpscharactersheet.com/downloads/$pkgver/$pkgname-$pkgver-linux.zip"
	'gcs.sh'
	'gcs.desktop'
)
sha256sums=(
	'8a7c4fabc6ae7ec53a9b5981f6a29489c42ce5ef94733fe92460421ae4a1efe8'
	'25042c6759fd814e23bf9139e6f6c5f93f67eec826f55825db052f4ff84ce241'
	'15f4bb0caaa0752cceba69c615e16848eba35f18b4d705caae0419a2aa0072f9'
)

package() {
	pushd "$srcdir/$pkgname-$pkgver-linux"

	# jars
	install -d "$pkgdir/usr/share/java/gcs"
	find support/jars -name '*.jar' -execdir install -m644 {} "$pkgdir/usr/share/java/gcs" \;

	# library
	install -d "$pkgdir/usr/share/gcs"
	cp -dr --no-preserve=ownership Library "$pkgdir/usr/share/gcs"

	# icon
	install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	convert support/gcs.png -resize 128 "$pkgdir/usr/share/icons/hicolor/128x128/apps/gcs.png"

	popd

	# launcher
	install -Dm755 "$srcdir/gcs.sh" "$pkgdir/usr/bin/gcs"

	# .desktop
	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/gcs.desktop" "$pkgdir/usr/share/applications"

	# remove version from filename
	mv "$pkgdir/usr/share/java/gcs/gcs-${pkgver}.jar" "$pkgdir/usr/share/java/gcs/gcs.jar"
}
