# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Chris Morgan <me@chrismorgan.info>
# Contributor: Carsten Feuls <archlinux dot carstenfeuls dot de>
# Contributor: Nils Czernia <nils at czserver dot de>

pkgname=matomo-bin
_pkgname=matomo
pkgver=5.6.1
pkgrel=1
pkgdesc="A real-time web analytics platform"
arch=("any")
url="https://matomo.org/"
license=("GPL-3.0-or-later")
depends=("php" "php-gd")
replaces=("piwik")
conflicts=("matomo")
provides=("matomo")
optdepends=(
	"mariadb: Database server"
	"python: Log importer script"
	"geoipupdate: GeoIP database")
install="${_pkgname}.install"
source=(
	"https://builds.matomo.org/${_pkgname}-${pkgver}.tar.gz"
	"https://builds.matomo.org/${_pkgname}-${pkgver}.tar.gz.asc")
backup=("usr/share/webapps/${_pkgname}/piwik.js" "usr/share/webapps/${_pkgname}/matomo.js")
sha256sums=('f55737e19793e02d665b399e1f20e56e6ea51c76ebfcbf29898243830045ca22'
            'SKIP')

validpgpkeys=("F529A27008477483777FC23D63BB30D0E5D2C749")

package() {
	install -d "${pkgdir}/usr/share/webapps"
	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}"
	# Some extensions want to append to piwik.js (matomo.js from 3.8.0 onwards),
	# so we reluctantly let them.
	chmod g+w "${pkgdir}/usr/share/webapps/${_pkgname}/piwik.js"
	chmod g+w "${pkgdir}/usr/share/webapps/${_pkgname}/matomo.js"

	# While installing matomo, it insists on being able to write to the config directory,
	# because it creates config.ini.php. After it’s installed, you can make it read-only,
	# e.g. by `chown -R root:http /etc/webapps/${_pkgname}`
	install -d "${pkgdir}/etc/webapps"
	mv "${pkgdir}/usr/share/webapps/${_pkgname}/config" "${pkgdir}/etc/webapps/${_pkgname}"
	ln -s "/etc/webapps/${_pkgname}" "${pkgdir}/usr/share/webapps/matomo/config"

	# matomo uses this tmp dir for writing its own data;
	# but it belongs in /var rather than /usr.
	rmdir "${pkgdir}/usr/share/webapps/matomo/tmp"
	install -dm700 "${pkgdir}/var/lib/webapps/matomo/tmp"
	ln -s "/var/lib/webapps/matomo/tmp" "${pkgdir}/usr/share/webapps/matomo/tmp"

	# Installing or upgrading non-core plugins requires write access to plugins/;
	# we could try g+w on the directory and try to restrict core plugins, but
	# then you’ve got mixed ownership (anything it creates will be http:http
	# instead of root:http) which is nasty. Another approach is to put `plugins`
	# in /var/lib with core plugins *actually* in /usr/share and symlinked back;
	# but that’s getting too clever for my sanity at present: this is all getting
	# rather bothersome; I’m tired of messing around with PHP apps that are
	# ill-designed for hardening and not designed for use in the scope of a
	# system package manager. So for now at least, we’re just going to leave it
	# as it is, chown the whole plugins directory in matomo.install, and wash our
	# hands of it.

	# GeoLite2-City.mmdb is provided by geoipupdate, which is optdepends.
	# See /etc/GeoIP.conf and make sure to enable geoipupdate's timer
	# Keep in mind it takes a while before a newly generated license becomes active
	# I figure a dead symlink should be safe if the DB is missing.
	ln -s "/var/lib/GeoIP/GeoLite2-City.mmdb" "${pkgdir}/usr/share/webapps/matomo/misc"
}
