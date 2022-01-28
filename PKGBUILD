# Maintainer: Laszlo Malina <laszlo.malina@processnet.hu>
# Contributor: Laszlo Malina <laszlo.malina@processnet.hu>
# Contributor: Immae <ismael.bouya@normalesup.org>
# Contributor: fila pruda.com
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=pure-ftpd-db
_srcname=pure-ftpd
pkgver=1.0.50
pkgrel=1
pkgdesc="A fast, production quality, standards-conformant FTP server. Compiled with mysql and pgsql."
arch=('i686' 'x86_64')
url="http://www.pureftpd.org/"
license=('custom')
provides=('pure-ftpd')
conflicts=('pure-ftpd')
depends=('openssl' 'mariadb-libs' 'postgresql-libs' 'libsodium' 'libldap')
backup=('etc/pure-ftpd/pure-ftpd.conf')
# https://download.pureftpd.org/pub/pure-ftpd/releases/
source=(
	"ftp://pureftpd.org/pub/${_srcname}/releases/${_srcname}-${pkgver}.tar.bz2"
	'pure-ftpd.service'
	'welcome.msg'
	'pure-ftpd.logrotate'
)

build() {
	cd ${srcdir}/${_srcname}-${pkgver}
	./configure \
	   --prefix=/usr \
	   --bindir=/usr/bin \
	   --sbindir=/usr/bin \
	   --with-puredb \
	   --with-pam \
	   --with-pgsql \
	   --with-mysql \
	   --with-ldap \
	   --with-extauth \
	   --with-altlog \
	   --with-cookie \
	   --with-diraliases \
	   --with-ftpwho \
	   --with-peruserlimits \
	   --with-quotas \
	   --with-ratios \
	   --with-rfc2640 \
	   --with-throttling \
	   --with-virtualhosts \
	   --with-virtualchroot \
	   --with-tls
	make
}

package() {
	cd ${srcdir}/${_srcname}-${pkgver}
	
	make DESTDIR=${pkgdir} install
	install -Dm644 pure-ftpd.conf ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	install -Dm644 ${srcdir}/pure-ftpd.service ${pkgdir}/usr/lib/systemd/system/pure-ftpd.service
	install -Dm644 ${srcdir}/pure-ftpd.logrotate ${pkgdir}/etc/logrotate.d/pure-ftpd
	install -Dm644 -t ${pkgdir}/etc/pure-ftpd/ pure-ftpd.conf ${srcdir}/welcome.msg
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${_srcname}/LICENSE
	install -d ${pkgdir}/usr/share/doc/${_srcname}/
	install -Dm644 -t ${pkgdir}/usr/share/doc/${_srcname}/ README* pureftpd-*.conf pureftpd.schema ChangeLog
	
	rm -f ${pkgdir}/etc/pure-ftpd.conf

	sed -i 's|#PIDFile\s.*/var/run/pure-ftpd.pid|PIDFile /run/pure-ftpd.pid|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|NoAnonymous\s.*no|NoAnonymous yes|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|#PIDFile\s.*/var/run/pure-ftpd.pid|PIDFile /run/pure-ftpd.pid|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# AltLog\s.*clf:/var/log/pureftpd.log|AltLog clf:/var/log/pureftpd.log|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# TLS\s.*1|TLS 1|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# TLSCipherSuite\s.*HIGH|TLSCipherSuite -S:HIGH:MEDIUM:+TLSv1|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
}
sha256sums=('6722c7fd09fe3c9ebbd572f3d097087ec7b32aacb3df8fa3400d4c07e4f377d7'
            '9be7c746d579ea83f17b21f58a4d0055caa370c7bfe543993b1d81ba91672d96'
            '7c20f36c26c5a5cc469f376f6d047a8dc082ed1c34e55f318993aa0f2f4a0646'
            'cabbdf0c1b9fb4651c6f30eea95438b1f4f2b6872e0a62a92cda99afb1b6f6c3')
