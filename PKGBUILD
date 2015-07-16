# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=gcs
pkgver=4.1.1
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
arch=('any')
url="http://gurpscharactersheet.com"
license=('MPL')
depends=('java-runtime=8')
makedepends=('git' 'apache-ant' 'java-environment=8' 'imagemagick')
source=(
	'git://code.trollworks.com/apple_stubs.git'
	"git://code.trollworks.com/gcs.git#tag=gcs-$pkgver"
	"git://code.trollworks.com/toolkit.git#tag=gcs-$pkgver"
	'gcs.sh'
	'gcs.desktop'
	'set_app_path_from_env.patch'
)
sha256sums=('SKIP' 'SKIP' 'SKIP'
	'a624fb16a1694c651b392cba91ff120b99ddf3dd1005b4174baca81770a8785c'
	'15f4bb0caaa0752cceba69c615e16848eba35f18b4d705caae0419a2aa0072f9'
	'f0a4f484f006da3f70fc26af15647478f6e721de113557f2cb1a93522a5f6d59'
)

prepare() {
	cd "$srcdir/toolkit"
	git apply "$srcdir/set_app_path_from_env.patch"
}

build() {
	# Java needs to be version 8
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

	# library
	install -d "$pkgdir/usr/share/gcs"
	cp -dr --no-preserve=ownership "$srcdir/gcs/Library" "$pkgdir/usr/share/gcs"

	# launcher
	install -Dm755 "$srcdir/gcs.sh" "$pkgdir/usr/bin/gcs"

	# .desktop
	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/gcs.desktop" "$pkgdir/usr/share/applications"

	# remove version from filename
	mv "$pkgdir/usr/share/java/gcs/gcs-${pkgver}.jar" "$pkgdir/usr/share/java/gcs/gcs.jar"

	# convert icon
	install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	convert "$srcdir/gcs/src/com/trollworks/gcs/app/images/app_1024.png" -resize 128 "$pkgdir/usr/share/icons/hicolor/128x128/apps/gcs.png"
}
