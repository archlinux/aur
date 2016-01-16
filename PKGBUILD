# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=4.12.1
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
         'ruby-opennebula>=4.12.1')
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
        'chown_fix.patch')
sha512sums=('d1f88ba8ccc8a718f6c3ff0cab2d5c72ae06f4e7c9f0bfd66e2142e7face31b5d28f839e02a92d07a34564403d3e09cdcea8128496756d523fe1531c3530f94b'
            'ca1080d6a37add816a4b7b10338cff437046e8f3ae0e40ea6b1a9d01663ea00c0d47436a6962bdd755a1325e73c91833cff07a9bc05d95f4aad6d08250f50577'
            '8d6a311072da61ca49458aaf787daf4ef5c5969a9aa282f2276d679dc38e14e5fd1c23bc51b12a29d2d40b65aa45bd2c38d6741726b09d75a38565b7d4ad4677')

prepare() {
	cd "${pkgname}-${pkgver}"

	# Patch upstream install script to not attempt to chown the install
	# directories because `makepkg` will otherwise fail on a fresh installation.
	# We do our own chown in post_install().
	patch < "${srcdir}/chown_fix.patch"
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
		DESTDIR="${pkgdir}" ./install.sh -k -u oneadmin -g cloud -d /srv/cloud/one
	else
		# Do not use -k when running ./install.sh for new installations
		DESTDIR="${pkgdir}" ./install.sh -u oneadmin -g cloud -d /srv/cloud/one
	fi
}
