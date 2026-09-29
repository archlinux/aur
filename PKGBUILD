# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Daniel Bodky <dbodky@gmail.com>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director-git
pkgver=1.12.0.r2.g4554f5be
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL-3.0-or-later')
arch=('any')
depends=(
	'icingaweb2'
	'icinga-php-legacy'
)
provides=('icingaweb2-module-director')
conflicts=('icingaweb2-module-director')
url="https://www.icinga.org"
install="icingaweb2-module-director.install"
source=(
	"git+https://github.com/Icinga/icingaweb2-module-director.git"
	"${pkgname%-git}.sysusers"
)
sha256sums=('SKIP'
            '311043f4f4da68e5fcf8ad8593475d8287fe2f681e52940b33d41bc681d74cec')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's/^v//'
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	install -dm770 "${pkgdir}/etc/icingaweb2/modules/director"
	chmod 2770 "${pkgdir}/etc/icingaweb2"
	mkdir -p "${pkgdir}/usr/share/webapps/icingaweb2/modules/director"

	cp -r * "${pkgdir}/usr/share/webapps/icingaweb2/modules/director"

	install -Dm644 "${srcdir}/${pkgname%-git}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
	install -Dm644 "contrib/systemd/icinga-director.service" "${pkgdir}/usr/lib/systemd/system/icinga-director.service"
}
