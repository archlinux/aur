# Wildfly Application Server package set up for systemd
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>
# Contributor: Zdenek Obst <zdenek dot obst at gmail dot com>
# shellcheck disable=2034

_pkg=wildfly
pkgname="${_pkg}"-systemd
pkgver=14.0.1.Final
pkgrel=1

pkgdesc='Wildfly Application Server'
arch=('any')
url='http://www.wildfly.org/'
license=('LGPL')
depends=('java-runtime>=8')
conflicts=('wildfly' 'wildfly-devel')

_pkgloc=opt
_cfgloc=etc
backup=("${_pkgloc}"/"${_pkg}"/domain/configuration/application-roles.properties
		"${_pkgloc}"/"${_pkg}"/domain/configuration/application-users.properties
		"${_pkgloc}"/"${_pkg}"/domain/configuration/logging.properties
		"${_pkgloc}"/"${_pkg}"/domain/configuration/mgmt-groups.properties
		"${_pkgloc}"/"${_pkg}"/domain/configuration/mgmt-users.properties
		"${_pkgloc}"/"${_pkg}"/domain/configuration/domain.xml
		"${_pkgloc}"/"${_pkg}"/domain/configuration/host.xml
		"${_pkgloc}"/"${_pkg}"/standalone/configuration/application-roles.properties
		"${_pkgloc}"/"${_pkg}"/standalone/configuration/application-users.properties
		"${_pkgloc}"/"${_pkg}"/standalone/configuration/logging.properties
		"${_pkgloc}"/"${_pkg}"/standalone/configuration/mgmt-groups.properties
		"${_pkgloc}"/"${_pkg}"/standalone/configuration/mgmt-users.properties
		"${_pkgloc}"/"${_pkg}"/standalone/configuration/standalone.xml
		"${_pkgloc}"/"${_pkg}"/bin/add-user.properties
		"${_pkgloc}"/"${_pkg}"/bin/appclient.conf
		"${_pkgloc}"/"${_pkg}"/bin/domain.conf
		"${_pkgloc}"/"${_pkg}"/bin/jboss-cli-logging.properties
		"${_pkgloc}"/"${_pkg}"/bin/jboss-cli.xml
		"${_pkgloc}"/"${_pkg}"/bin/standalone.conf
		"${_cfgloc}"/"${_pkg}"/wildfly.conf
		"${_cfgloc}"/systemd/system/wildfly.service
		"${_pkgloc}"/"${_pkg}"/bin/launch.sh)

install=${_pkg}.install

source=(https://download.jboss.org/wildfly/"${pkgver}"/"${_pkg}"-"${pkgver}".tar.gz
		"${_pkg}".install)

sha256sums=('e12092ec6a6e048bf696d5a23c3674928b41ddc3f810016ef3e7354ad79fc746'
			'15c59a22a28ccab3378479e2f05376e2e921d6812b54ac66f3e7056a5f39be54')

package() {
	# shellcheck disable=2154
	cd "${srcdir}"/"${_pkg}"-"${pkgver}" || exit
	echo "   -> Removing unneeded .bat and .exe files..."
	rm -f bin/*.{bat,exe}
	echo "   -> Unpacking the package files..."
	# shellcheck disable=2154
	install -dm755 "${pkgdir}"/"${_pkgloc}"
	cp -R "${srcdir}"/"${_pkg}"-"${pkgver}" "${pkgdir}"/"${_pkgloc}"/"${_pkg}"
	# shellcheck disable=2154
	chmod -R u=rwX,g=rwX,o=rX "${pkgdir}"/"${_pkgloc}"/"${_pkg}"
	mkdir -p "${pkgdir}"/"${_cfgloc}"/"${_pkg}"
	mkdir -p "${pkgdir}"/"${_cfgloc}"/systemd/system
	echo "   -> Creating wildfly.conf (environment settings)..."
	cp "${srcdir}"/"${_pkg}"-"${pkgver}"/docs/contrib/scripts/systemd/wildfly.conf "${pkgdir}"/"${_cfgloc}"/"${_pkg}"/
	echo "   -> Placing wildfly.service in systemd directory..."
	cp "${srcdir}"/"${_pkg}"-"${pkgver}"/docs/contrib/scripts/systemd/wildfly.service "${pkgdir}"/"${_cfgloc}"/systemd/system/
	echo "   -> Copying launch.sh to the bin directory..."
	cp "${srcdir}"/"${_pkg}"-"${pkgver}"/docs/contrib/scripts/systemd/launch.sh "${pkgdir}"/"${_pkgloc}"/"${_pkg}"/bin/
}
