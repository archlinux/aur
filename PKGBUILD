# Wildfly Application Server package set up for systemd
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>
# Contributor: Zdenek Obst <zdenek dot obst at gmail dot com>
# shellcheck disable=2034

_pkg=wildfly
pkgname="${_pkg}"-systemd
pkgver=15.0.0.Final
pkgrel=1

pkgdesc='Wildfly Application Server with systemd integration'
arch=('any')
url='http://www.wildfly.org/'
license=('LGPL')
depends=('java-runtime>=8')
conflicts=('wildfly' 'wildfly-devel')

_pkgloc=opt
_cfgloc=etc
_sysdloc=usr/lib/systemd/system
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
		"${_sysdloc}"/wildfly.service
		"${_pkgloc}"/"${_pkg}"/bin/launch.sh)

install=${_pkg}.install

source=(https://download.jboss.org/wildfly/"${pkgver}"/"${_pkg}"-"${pkgver}".tar.gz
		"${_pkg}".install)

sha256sums=('52a41ca0e36dc41800214e6a8f4e0032276477299804e6a719ba1ffe35d37a92'
			'2844ec981fcf9e6fd93226796e7531b9b8fd30806adba6b31e43d9592a6409c2')

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
	mkdir -p "${pkgdir}"/"${_sysdloc}"/
	echo "   -> Creating wildfly.conf (environment settings)..."
	cp "${srcdir}"/"${_pkg}"-"${pkgver}"/docs/contrib/scripts/systemd/wildfly.conf "${pkgdir}"/"${_cfgloc}"/"${_pkg}"/
	echo "   -> Placing wildfly.service in /$_sysdloc..."
	cp "${srcdir}"/"${_pkg}"-"${pkgver}"/docs/contrib/scripts/systemd/wildfly.service "${pkgdir}"/"${_sysdloc}"/
	echo "   -> Copying launch.sh to the bin directory..."
	cp "${srcdir}"/"${_pkg}"-"${pkgver}"/docs/contrib/scripts/systemd/launch.sh "${pkgdir}"/"${_pkgloc}"/"${_pkg}"/bin/
}
