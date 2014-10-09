# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=gcs
pkgver=4.0.1
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
arch=('any')
url="http://gurpscharactersheet.com"
license=('MPL')
depends=('java-runtime=8')
makedepends=('git' 'apache-ant' 'java-environment=8' 'imagemagick')
source=(
	'git://code.trollworks.com/apple_stubs.git'
	"git://code.trollworks.com/gcs.git#tag=$pkgver"
	"git://code.trollworks.com/toolkit.git#tag=$pkgver"
	'gcs.sh'
	'gcs.desktop'
	'set_app_path_from_env.patch'
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "$srcdir/toolkit"
	git apply "$startdir/set_app_path_from_env.patch"
}

build() {
	echo "Checking that Java is version 8..."
	java -version 2>&1 | grep 'version "1.8' >/dev/null

	cd "$srcdir/apple_stubs"
	ant
	cd "$srcdir/toolkit"
	ant
	cd "$srcdir/gcs"
	ant
}

package() {
	# jars
	install -d "$pkgdir/usr/share/java/gcs"
	find "$srcdir" -name '*.jar' ! -name '*-src.*' -execdir install -m644 {} "$pkgdir/usr/share/java/gcs" \;
	# remove version from main jar name
	mv "$pkgdir/usr/share/java/gcs/gcs-${pkgver}.jar" "$pkgdir/usr/share/java/gcs/gcs.jar"

	# library
	install -d "$pkgdir/usr/share/gcs"
	cp -dr --no-preserve=ownership "$srcdir/gcs/Library" "$pkgdir/usr/share/gcs"

	# launcher
	install -Dm755 "$startdir/gcs.sh" "$pkgdir/usr/bin/gcs"

	# .desktop
	install -d "$pkgdir/usr/share/applications"
	install -m644 "$startdir/gcs.desktop" "$pkgdir/usr/share/applications"

	# icon
	install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	convert "$srcdir/gcs/src/com/trollworks/gcs/app/images/app_1024.png" -resize 128 "$pkgdir/usr/share/icons/hicolor/128x128/apps/gcs.png"
}
