# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=octopi-notifier-noknotify
pkgdesc="Notifier for Octopi without knotify"
pkgver=0.12.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/aarnt/octopi"
license=('GPL2')
conflicts=('octopi-notifier-qt4' 'octopi-notifier-kde' 'octopi-notifier-kde4' 'octopi-notifier')
depends=('octopi' 'libnotify')
makedepends=('qt5-declarative')
optdepends=('xfce4-notifyd: for notifications in XFCE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aarnt/octopi/archive/v${pkgver}.tar.gz")
install=octopi.install
sha256sums=('b679a3822d3060dfe5a4fd2ba68b50b4db6d7bf0e68197ca330ee9cb66e2b0c5')

prepare() {
	_cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
	_jc=$((${_cpucount:-1}))

	cd "${srcdir}/octopi-${pkgver}"
}

build() {
	cd "${srcdir}/octopi-${pkgver}"

	qmake-qt5 octopi.pro
	make -j $_jc

	cd "${srcdir}/octopi-${pkgver}/notifier/"
	msg "Building octopi-notifier..."
	qmake-qt5 octopi-notifier.pro
	make -j $_jc
}

package() {
	cd "${srcdir}/octopi-${pkgver}"

	install -D -m755 "${srcdir}/octopi-${pkgver}/notifier/bin/octopi-notifier" "${pkgdir}/usr/bin/octopi-notifier"
	install -D -m644 "${srcdir}/octopi-${pkgver}/notifier/octopi-notifier.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/octopi-${pkgver}/notifier/octopi-notifier.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
