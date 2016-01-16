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
        'chown_fix.patch')
sha512sums=('ed572bf1a6e0a4eecb85c1f2beb1f686e6729f74a354f41dbb5113fd089af06013f63d022ee8c068234e5be64df818771a0ba0c452ffbf4fd096dd16cf878926'
            'aa03623853515afc0f0e25e76a4f55fc844570ec432c8398616e336402fad0f6eea5853fe2488f6a0069831dfb6528ee8cd38772ffe415e349b9394c851299f1'
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

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /srv/cloud/one/bin/econe-allocate-address "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-associate-address "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-attach-volume "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-create-keypair "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-create-volume "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-delete-keypair "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-delete-volume "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-describe-addresses "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-describe-images "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-describe-instances "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-describe-keypairs "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-describe-volumes "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-detach-volume "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-disassociate-address "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-reboot-instances "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-register "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-release-address "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-run-instances "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-server "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-start-instances "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-stop-instances "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-terminate-instances "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/econe-upload "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/mm_sched "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/novnc-server "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/one "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oneacct "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oneacl "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onecluster "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oned "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onedatastore "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onedb "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oneflow "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oneflow-server "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oneflow-template "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onegate-server "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onegroup "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onehost "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oneimage "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onemarket "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onesecgroup "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oneshowback "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onetemplate "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/oneuser "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onevcenter "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onevdc "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onevm "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onevnet "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/onezone "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/sunstone-server "${pkgdir}/usr/bin/"
  ln -s /srv/cloud/one/bin/tty_expect "${pkgdir}/usr/bin/"
}
