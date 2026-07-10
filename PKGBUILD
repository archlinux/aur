# Maintainer: Christopher Kreft <email@christopherkreft.de>
# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Idares <idares at seznam dot cz>

_pkgname=monitoring-plugins
pkgname=${_pkgname}-git
pkgver=3.0.1.r3.gb6021e5
pkgrel=1
pkgdesc="Plugins for Icinga, Naemon, Nagios, Shinken, Sensu and other monitoring applications"
arch=('x86_64')
url="https://github.com/monitoring-plugins/monitoring-plugins/"
license=('GPL-3.0-or-later')
depends=(
	'libcap'
	'perl')
makedepends=(
	'git'
	'net-snmp' 'postgresql-libs' 'libdbi' 'mariadb-libs'
	'procps-ng' 'iputils' 'fping' 'dnsutils' 'rpcbind' 'smbclient' 'openssh'
	'postfix' 'perl-net-snmp' 'curl' 'uriparser')
optdepends=(
	'net-snmp: for SNMP checking'
	'uriparser: for check_curl'
	'curl: for check_curl'
	'postgresql-libs: for check_pgsql'
	'mariadb-libs: for check_mysql_query and check_mysql'
	'libdbi: for check_dbi'
	'libldap: for check_ldap')
provides=("${_pkgname}" 'nagios-plugins')
conflicts=("${_pkgname}" "${_pkgname}-debug" 'nagios-plugins')
install=${_pkgname}.install
source=("${_pkgname}::git+https://github.com/monitoring-plugins/monitoring-plugins.git")
sha256sums=('SKIP')

_upstream_version() {
	local version
	version=$(git tag --sort=-v:refname | sed -nE 's/^v([0-9]+(\.[0-9]+)+)$/\1/p' | head -n1)

	printf '%s.r%s.g%s' \
		"$version" \
		"$(git rev-list --count "v${version}..HEAD")" \
		"$(git rev-parse --short=7 HEAD)"
}

pkgver() {
	cd "$_pkgname"

	_upstream_version
}

prepare() {
	cd "$_pkgname"

	local version
	version=$(_upstream_version)
	printf '%s\n' "$version" > release
	sed -i "s|^AC_INIT.*|AC_INIT([$_pkgname],[$version])|" configure.ac

	./tools/setup
}

build() {
	cd "$_pkgname"

	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/monitoring-plugins \
		--with-ping-command='/usr/bin/ping -4 -n -U -w %d -c %d %s' \
		--with-ping6-command='/usr/bin/ping -6 -n -U -w %d -c %d %s'

	make
	make ChangeLog THANKS
}

package() {
	cd "$_pkgname"

	make DESTDIR="${pkgdir}" install

	# Upstream heavily discourages against setuid, which their current build system
	# currently uses, as it is apparently nontrivial to replace it for all
	# platforms with setcap in the Makefile

	# Remove setuid bit from the two files, replaced by setcap via .install
	chmod 755 "${pkgdir}"/usr/lib/monitoring-plugins/check_{dhcp,icmp}

	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING

	for i in ABOUT-NLS ACKNOWLEDGEMENTS AUTHORS CODING ChangeLog \
		FAQ NEWS README REQUIREMENTS SUPPORT THANKS; do
		install -Dm644 ${i} "${pkgdir}"/usr/share/doc/${pkgname}/${i}
	done
}
