# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=gcs
pkgver=4.0.1
pkgrel=1
pkgdesc="A WYSIWYG editor for building character sheets for GURPS 4th Edition."
arch=('any')
url="http://gurpscharactersheet.com"
license=('MPL')
makedepends=('git' 'apache-ant')
depends=('java-runtime')
source=(
	'git://code.trollworks.com/apple_stubs.git'
	"git://code.trollworks.com/gcs.git#tag=$pkgver"
	"git://code.trollworks.com/toolkit.git#tag=$pkgver"
)
md5sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "$srcdir/toolkit"
	git apply "$startdir/set_app_path_from_env.patch"
}

build() {
	cd "$srcdir/apple_stubs"
	ant
	cd "$srcdir/toolkit"
	ant
	cd "$srcdir/gcs"
	ant
}

package() {
	install -d "$pkgdir/usr/share/java/gcs"
	find "$srcdir" -name '*.jar' ! -name '*-src.*' -execdir install -m644 {} "$pkgdir/usr/share/java/gcs" \;
	mv $pkgdir/usr/share/java/gcs/gcs-*.jar "$pkgdir/usr/share/java/gcs/gcs.jar"

	install -d "$pkgdir/usr/share/gcs"
	cp -dr --no-preserve=ownership "$srcdir/gcs/Library" "$pkgdir/usr/share/gcs"

	install -Dm755 "$startdir/gcs.sh" "$pkgdir/usr/bin/gcs"
}
