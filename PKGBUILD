# Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=4.14.2
pkgrel=1
pkgdesc="Virtual management infrastructure as a service (IaaS) toolkit for cloud computing (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='http://docs.opennebula.org/stable'
license=('Apache')
depends=('ruby>=1.8.7'
         'xmlrpc-c>=1.31'
         'openssl>=0.9.8'
         'sqlite3>=3.6'
         'openssh'
         'libxml2>=2.7'
         'curl'
         'libxslt'
         'expat'
         'cdrkit'
         'log4cpp>=1.0'
         'ruby-opennebula>=4.14.2'
         'ruby-sinatra'
         'ruby-builder')
makedepends=('xmlrpc-c>=1.31'
             'pkgconfig'
             'scons>=0.98')
optdepends=('nfs-utils: for using the shared file system storage model'
            'mariadb>=5.1: optional replacement for SQLite as the DB back-end'
            'libmariadbclient>=5.1: required if using MariaDB/MySQL instead of SQLite')
conflicts=('opennebula-unstable')
install=opennebula.install
changelog=ChangeLog
source=("http://downloads.opennebula.org/packages/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'opennebula.service'
        'chown_fix.patch'
        'set_locations.patch')
sha512sums=('ed572bf1a6e0a4eecb85c1f2beb1f686e6729f74a354f41dbb5113fd089af06013f63d022ee8c068234e5be64df818771a0ba0c452ffbf4fd096dd16cf878926'
            'a142effd0037966a04a9bbb8416c12835f676108c53b1e42186cec9222cc09a60a01be1ddf24773914f2615238f501579e4d39abbf28c5f89b0fc7140855af20'
            '8d6a311072da61ca49458aaf787daf4ef5c5969a9aa282f2276d679dc38e14e5fd1c23bc51b12a29d2d40b65aa45bd2c38d6741726b09d75a38565b7d4ad4677'
            '1f20e688a0f6d36a6bc875392473e75c7de77b159b9cbdf262ac0f093b4d65555231ab15897156e2558d0df6ae631f8d79a3265073ea8c0546586937544e47c9')

prepare() {
	cd "${pkgname}-${pkgver}"

	# Patch upstream install script to not attempt to chown the install
	# directories because `makepkg` will otherwise fail on a fresh installation.
	# We do our own chown in post_install().
  patch < "${srcdir}/chown_fix.patch"
	patch < "${srcdir}/set_locations.patch"
}

build() {
	cd "${pkgname}-${pkgver}"

	###########################################################################
	##                                                                       ##
	## It is highly recommended that you read the documentation and tweak    ##
	##     the PKGBUILD accordingly:                                         ##
	## http://docs.opennebula.org/stable/integration/references/compile.html ##
	##                                                                       ##
	## This package assumes a self-contained install. If you do NOT want a   ##
	##     self-contained install, then remove `-d /srv/cloud/one` from the  ##
	##     package() function and MAKE SURE you properly change the          ##
	##     appropriate sections of opennebula-unstable.install               ##
	##                                                                       ##
	###########################################################################

	# This builds the vanilla OpenNebula package. Tweak this line as desired.
	scons new_xmlrpc=yes
}

package() {
	cd "${pkgname}-${pkgver}"

	install -D -m644 "${srcdir}/opennebula.service" "${pkgdir}/usr/lib/systemd/system/opennebula.service"

	# This checks to see whether OpenNebula is currently installed. To avoid
	# a potentially scary message, errors are sent to /dev/null
	if [[ ("$(pacman -Qq ${pkgname} 2>/dev/null)" == "${pkgname}") || ("$(pacman -Qq ${_unstable_pkg} 2>/dev/null)" == "${_unstable_pkg}") ]]; then
		# Use -k when running ./install.sh to keep previous configuration files
		# Note: It is highly recommended to not keep the oned.conf file.
		DESTDIR="${pkgdir}" ./install.sh -k -u oneadmin -g cloud
	else
		# Do not use -k when running ./install.sh for new installations
		DESTDIR="${pkgdir}" ./install.sh -u oneadmin -g cloud
	fi
}
