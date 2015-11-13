# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=octopi-notifier-noknotify
pkgdesc="Notifier for Octopi without knotify"
pkgver=0.8.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/aarnt/octopi"
license=('GPL2')
conflicts=('octopi-notifier-qt4' 'octopi-notifier-kde' 'octopi-notifier-kde4' 'octopi-notifier')
depends=('octopi' 'libnotify')
makedepends=('qt5-declarative' 'libnotify')
optdepends=('xfce4-notifyd: for notifications in XFCE')
source=("https://github.com/aarnt/octopi/archive/v${pkgver}.tar.gz")
install=octopi.install
sha256sums=('79ab8a24e3329ab4e5320e03309f44f802336cc00bada0f9a37fae46f5eeb02b')

prepare() {
	_cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
	_jc=$((${_cpucount:-1}))
   
	cd "${srcdir}/octopi-${pkgver}"
}            
            
build() {
	cd "${srcdir}/octopi-${pkgver}"

	qmake-qt5 octopi.pro
	make -j $_jc

	cd "${srcdir}/octopi-${pkgver}/notifier/octopi-notifier"
	msg "Building octopi-notifier..."
	qmake-qt5 octopi-notifier.pro
	make -j $_jc
}

package() {
	cd "${srcdir}/octopi-${pkgver}"

	install -D -m755 "${srcdir}/octopi-${pkgver}/notifier/bin/octopi-notifier" "${pkgdir}/usr/bin/octopi-notifier"
	install -D -m644 "${srcdir}/octopi-${pkgver}/octopi-notifier.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/octopi-${pkgver}/octopi-notifier.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
