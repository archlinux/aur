# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mark Wagie <mark.wagie@tutanota.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>
# Contributor: Filip Kemuel Dam Bartholdy <filip_kemuel@yahoo.dk>

pkgname=typecatcher
pkgver=0.4
pkgrel=3
pkgdesc='Download Google webfonts for off-line use'
arch=(any)
url="https://github.com/andrewsomething/$pkgname"
license=(GPL3)
depends=(gtk3
         python
         python-gobject
         webkit2gtk
         yelp)
makedepends=(python-distutils-extra)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8b7b78bac166c64f12de1314e5aea2791cb5628ca27447eb29efc408c50c36e7')


prepare() {
	cd "$_archive"

	# Remove Ubuntu specific crash handler
	rm -rf apport etc

	# Ignore broken distuils stuff (desktop file installs fail)
	sed -i -e '/sys.exit/d' setup.py
}

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS

	# Install files DistUtils fails to install
	install -d "$pkgdir/usr/share/locale"
	cp -r build/mo/* "$pkgdir/usr/share/locale"

	install -d "$pkgdir/usr/share/help/C/$pkgname"
	cp -r help/C/* "$pkgdir/usr/share/help/C/$pkgname/"

	install -Dm644 -t "$pkgdir/usr/share/applications/" \
		"build/share/applications/$pkgname.desktop"

	install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	ln -s "/usr/share/$pkgname/$pkgname.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
