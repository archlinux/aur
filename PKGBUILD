# Maintainer: RedTide <redtid3@gmail.com>

prjname=jacksettings
pkgname=${prjname}-git
pkgver=r44.3851e3a
pkgrel=1
pkgdesc="JACK settings using jackd via systemd"
url="https://github.com/redtide/${prjname}"
arch=('x86_64')
license=('GPL2')
depends=('qt5-base' 'jack2')
optdepends=('a2jmidid: A daemon for exposing legacy ALSA sequencer applications in JACK MIDI system.')
makedepends=('git')
provides=('jacksettings')
conflicts=('jacksettings')
source=("${pkgname}"::"git+https://github.com/redtide/${prjname}.git")
md5sums=('SKIP')
pkgver() {
	cd "${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
build() {
	cd "${srcdir}/${pkgname}"
	qmake PREFIX="/usr/" JACKSettings.pro
	make INSTALL_DIR=$pkgdir
}
package() {
	cd "${srcdir}/${pkgname}"
	make INSTALL_ROOT=$pkgdir install
	install -Dm644 "${srcdir}/${pkgname}/systemd/a2jmidi@.service" "${pkgdir}/usr/lib/systemd/user/a2jmidi@.service"
}
