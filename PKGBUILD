# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname="nemo-pdf-tools"
pkgver="1.2.9.0extras20.04.03"
_pkgver="1.2.9-0extras20.04.03"
pkgrel="4"
pkgdesc="Tools to work with PDF files from Nemo"
arch=('any')
url="https://www.atareao.es/aplicacion/pdf-tools-o-modificar-pdf-en-linux/"
_ppaurl=('https://launchpad.net/~atareao/+archive/ubuntu/nemo-extensions')
license=('MIT')
depends=('hicolor-icon-theme' 'nemo-python' 'python-cairo' 'python-pillow' 'python-plumbum' 'gtk3' 'poppler' 'python-sh')
conflicts=("${pkgname}-git")
source=("${pkgname}_${_pkgver}.tar.xz::${_ppaurl}/+sourcefiles/${pkgname}/${_pkgver}/${pkgname}_${_pkgver}.tar.xz")
sha256sums=('3c3a57162258eddefa27a4557286b0d0ce262ee6f047681f82dd0fbb182e13c4')

prepare() {
	cd "${srcdir}/temporal"

	# Install locales to correct directory
	find . -type f -exec \
		sed -i -e 's:locale-langpack:locale:g' '{}' \;

	# Create a script to install the translations from the debian rules file
	grep -A 1000 "Create languages directories" debian/rules | \
		grep -B 1000 "End comile languages" | \
		sed "s:\${CURDIR}/debian/nemo-pdf-tools:\"${pkgdir}\":g" > make_translations.sh
	chmod +x make_translations.sh
}

package() {
	cd "${srcdir}/temporal"
	install -Dm755 -t "${pkgdir}/usr/share/nemo-python/extensions" src/*.py
	install -Dm644 -t "${pkgdir}/usr/share/nemo-python/extensions/pdf-tools" src/pdf-tools/*.py
	cd "${srcdir}/temporal"
	install -Dm644 data/icons/updf.svg \
		"${pkgdir}/usr/share/nemo-python/extensions/pdf-tools/icons/updf.svg"
	install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/status" data/icons/pdf-tools*.svg
	install -Dm644 debian/changelog -t "${pkgdir}/usr/share/nemo-python/extensions/pdf-tools"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	./make_translations.sh

	# ----------------------------------------------------------------------------------------------
	# fix for error in nemo-pdf-tools.py
	cd "${pkgdir}/usr/share/nemo-python/extensions"
	sed -i "s/Gtk-find-and-replace/edit-find-replace/g" nemo-pdf-tools.py
	# ----------------------------------------------------------------------------------------------
}
