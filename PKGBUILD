# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ValHue <vhuelamo at gmail dot com>
pkgname=nautilus-pdf-tools
_pkgver=1.2.9-0extras20.04.02
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools to work with PDF files from Nautilus"
arch=('any')
url="https://github.com/atareao/nautilus-pdf-tools"
license=('GPL3')
depends=('python-cairo' 'python-pillow' 'gtk3' 'poppler' 'python-pypdf2'
         'python-sh' 'python-plumbum' 'python-nautilus')
source=("https://launchpad.net/~atareao/+archive/ubuntu/nautilus-extensions/+files/${pkgname}_${_pkgver}.tar.xz")
sha256sums=('817e98926d8a4dc148e308a84be4f340be0420a76603e5927a3e96129574408b')

prepare() {
	cd "$srcdir/temporal"

	# Install locales to correct directory
	find . -type f -exec \
		sed -i -e 's:locale-langpack:locale:g' '{}' \;

	# Create a script to install the translations from the debian rules file
	grep -A 1000 "Create languages directories" debian/rules | \
		grep -B 1000 "End comile languages" | \
		sed "s:\${CURDIR}/debian/nautilus-pdf-tools:\"$pkgdir\":g" > make_translations.sh
	chmod +x make_translations.sh
}

package() {
	cd "$srcdir/temporal"
	install -d "$pkgdir/usr/share/nautilus-python/extensions/pdf-tools"
	cp -r src/*.py "$pkgdir/usr/share/nautilus-python/extensions"
	cp -r src/pdf-tools/*.py "$pkgdir/usr/share/nautilus-python/extensions/pdf-tools"
	install -Dm644 data/icons/updf.svg -t \
		"$pkgdir/usr/share/nautilus-python/extensions/pdf-tools/icons"
	install -Dm644 data/icons/pdf-tools-password-{hide,show}.svg -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/status"
	install -Dm644 debian/changelog -t "$pkgdir/usr/share/nautilus-python/extensions/pdf-tools"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	./make_translations.sh
}
