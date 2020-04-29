# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('nautilus-pdf-tools-git' 'nemo-pdf-tools-git' 'caja-pdf-tools-git')
pkgbase=nautilus-pdf-tools-git
pkgver=1.2.9.0extras20.04.01.r99.014bd82
pkgrel=1
arch=('any')
url="https://github.com/atareao/nautilus-pdf-tools"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/atareao/nautilus-pdf-tools.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgbase%-git}"
	printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
		sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgbase%-git}"

	# Install locales to correct directory
	find . -type f -exec \
		sed -i -e 's:locale-langpack:locale:g' '{}' \;

	# Create a script to install the translations from the debian rules file
	grep -A 1000 "Create languages directories" debian/rules | \
		grep -B 1000 "End comile languages" | \
		sed "s:\${CURDIR}/debian/nautilus-pdf-tools:\"$pkgdir\":g" > make_translations.sh
	chmod +x make_translations.sh

	cp make_translations.sh make_translations-nemo.sh
	sed -i 's/nautilus/nemo/g' make_translations-nemo.sh
	chmod +x make_translations-nemo.sh

	cp make_translations.sh make_translations-caja.sh
	sed -i 's/nautilus/caja/g' make_translations-caja.sh
	chmod +x make_translations-caja.sh
}

package_nautilus-pdf-tools-git() {
	pkgdesc="Tools to work with PDF files from Nautilus"
	depends=('python-nautilus' 'python-cairo' 'python-pillow' 'gtk3' 'poppler' 'python-pypdf2'
	         'python-sh' 'python-plumbum')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/${pkgbase%-git}"
	install -d "$pkgdir/usr/share/nautilus-python/extensions/pdf-tools"
	cp -r src/*.py "$pkgdir/usr/share/nautilus-python/extensions"
	cp -r src/pdf-tools/*.py "$pkgdir/usr/share/nautilus-python/extensions/pdf-tools"
	install -Dm644 data/icons/updf.svg -t \
		"$pkgdir/usr/share/nautilus-python/extensions/pdf-tools/icons"
	install -Dm644 data/icons/pdf-tools-password-{hide,show}.svg -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/status"
	install -Dm644 debian/changelog -t "$pkgdir/usr/share/nautilus-python/extensions/pdf-tools"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
	./make_translations.sh
}

package_nemo-pdf-tools-git() {
	pkgdesc="Tools to work with PDF files from Nemo"
	depends=('nemo-python' 'python-cairo' 'python-pillow' 'gtk3' 'poppler' 'python-pypdf2'
	         'python-sh' 'python-plumbum')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/${pkgbase%-git}"
	install -d "$pkgdir/usr/share/nemo-python/extensions/pdf-tools"
	cp -r src/*.py "$pkgdir/usr/share/nemo-python/extensions"
	cp -r src/pdf-tools/*.py "$pkgdir/usr/share/nemo-python/extensions/pdf-tools"
	install -Dm644 data/icons/updf.svg -t \
		"$pkgdir/usr/share/nemo-python/extensions/pdf-tools/icons"
	install -Dm644 data/icons/pdf-tools-password-{hide,show}.svg -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/status"
	install -Dm644 debian/changelog -t "$pkgdir/usr/share/nemo-python/extensions/pdf-tools"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
	./make_translations-nemo.sh
}

package_caja-pdf-tools-git() {
	pkgdesc="Tools to work with PDF files from Caja"
	depends=('python-caja' 'python-gobject' 'python-cairo' 'python-pillow' 'gtk3' 'poppler'
	         'python-pypdf2' 'python-sh' 'python-plumbum')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/${pkgbase%-git}"
	install -d "$pkgdir/usr/share/caja-python/extensions/pdf-tools"
	cp -r src/*.py "$pkgdir/usr/share/caja-python/extensions"
	cp -r src/pdf-tools/*.py "$pkgdir/usr/share/caja-python/extensions/pdf-tools"
	install -Dm644 data/icons/updf.svg -t \
		"$pkgdir/usr/share/caja-python/extensions/pdf-tools/icons"
	install -Dm644 data/icons/pdf-tools-password-{hide,show}.svg -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/status"
	install -Dm644 debian/changelog -t "$pkgdir/usr/share/caja-python/extensions/pdf-tools"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
	./make_translations-caja.sh
}
