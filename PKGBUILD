# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="calendar-indicator"
pkgver="0.4.0.0extras19.04.1"
_pkgver="0.4.0-0extras19.04.1"
pkgrel="1"
pkgdesc="An indicator for Google calendar."
arch=('any')
url="https://www.atareao.es/aplicacion/calendar-indicator-o-google-calendar-en-ubuntu/"
_ppaurl=('https://launchpad.net/~atareao/+archive/ubuntu/atareao')
license=('GPL3')
depends=('libappindicator-gtk3' 'python' 'shared-mime-info' 'python-beautifulsoup4' 'python-dateutil' 'python-jinja' 'python-requests')
conflicts=('calendar-indicator-bzr')

source=("${pkgname}_${_pkgver}.tar.xz::${_ppaurl}/+sourcefiles/${pkgname}/${_pkgver}/${pkgname}_${_pkgver}.tar.xz")
sha256sums=('5299dacd33443196ab41fc0e593a4d56c7815cdfab02b9ce00b9da83cdc5f3fe')

prepare() {
	cd "${srcdir}/${pkgname}"

	# Install locales to correct directory
	find . -type f -exec \
		sed -i -e 's:locale-langpack:locale:g' '{}' \;

	# Create a script to install the translations from the debian rules file
	grep -A 1000 "Create languages directories" debian/rules | \
		grep -B 1000 "End comile languages" | \
		sed "s:\${CURDIR}/debian/calendar-indicator:\"${pkgdir}\":g" > make_translations.sh
	chmod +x make_translations.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/bin"
    install -d "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/share/calendar-indicator"
    cp -r bin/* "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/bin"
    cp -r src/*.py "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/share/calendar-indicator"
	install -Dm644 debian/changelog -t "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/share/calendar-indicator"
    install -Dm644 data/social/*.svg -t \
        "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/share/calendar-indicator/social"
    install -Dm644 data/icons/*.svg -t \
        "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/share/calendar-indicator/icons"
	install -Dm644 data/icons/calendar-indicator.svg -t \
        "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/share/pixmaps"
	install -Dm644 data/calendar-indicator-autostart.desktop -t \
        "${pkgdir}/opt/extras.ubuntu.com/calendar-indicator/share/calendar-indicator"
	install -Dm644 data/extras-calendar-indicator.desktop -t \
        "${pkgdir}/usr/share/applications"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	./make_translations.sh
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
