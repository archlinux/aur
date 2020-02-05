# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="nemo-pdf-tools"
pkgver="1.2.9.0extras19.06.7"
_pkgver="1.2.9-0extras19.06.7"
pkgrel="1"
pkgdesc="Tools to work with PDF files from Nemo"
arch=('any')
url="https://www.atareao.es/aplicacion/pdf-tools-o-modificar-pdf-en-linux/"
_ppaurl=('https://launchpad.net/~atareao/+archive/ubuntu/nemo-extensions')
license=('MIT')
depends=('hicolor-icon-theme' 'nemo-python' 'python-cairo' 'python-pillow' 'gtk3' 'poppler' 'python-pypdf2' 'python-sh')
conflicts=("${pkgname}-git")

source=("${pkgname}_${_pkgver}.tar.xz::${_ppaurl}/+sourcefiles/${pkgname}/${_pkgver}/${pkgname}_${_pkgver}.tar.xz")
sha256sums=('31c0ca2c82634fbd323d5ef3b88068edb22bbf66ffe31acf3d78786aa2d02d12')

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
    install -d "${pkgdir}/usr/share/nemo-python/extensions/pdf-tools"
    cp -r src/*.py "${pkgdir}/usr/share/nemo-python/extensions"
    cp -r src/pdf-tools/*.py "${pkgdir}/usr/share/nemo-python/extensions/pdf-tools"
	install -Dm644 data/icons/updf.svg -t \
	    "${pkgdir}/usr/share/nemo-python/extensions/pdf-tools/icons"
	install -Dm644 data/icons/pdf-tools-password-hide.svg -t \
		"${pkgdir}/usr/share/icons/hicolor/scalable/status"
	install -Dm644 data/icons/pdf-tools-password-show.svg -t \
		"${pkgdir}/usr/share/icons/hicolor/scalable/status"
	install -Dm644 debian/changelog -t "${pkgdir}/usr/share/nemo-python/extensions/pdf-tools"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	./make_translations.sh
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
