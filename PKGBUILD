# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: fila pruda.com
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=pure-ftpd
pkgver=1.0.41
pkgrel=1
pkgdesc="A secure, production-quality and standard-conformant FTP server, focused on efficiency and ease of use."
arch=('i686' 'x86_64')
url="http://www.pureftpd.org/"
license=('custom')
depends=('openssl' 'libmariadbclient')
conflicts=('pure-ftpd-db')
backup=('etc/pure-ftpd/pure-ftpd.conf')
source=("http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${pkgver}.tar.bz2"
	'pure-ftpd.service'
	'pure-ftpd.logrotate'
	'welcome.msg'
	'pure-ftpd.pem'
	'pure-ftpd-dhparams.pem' )

md5sums=('76c2364591418f153ed815034621d058'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr \
	--bindir=/usr/bin \
	--sbindir=/usr/bin \
	--with-puredb \
	--with-ftpwho \
	--with-altlog \
	--with-cookie \
	--with-mysql \
	--with-diraliases \
	--with-quotas \
	--with-peruserlimits \
	--with-tls \
	--with-rfc2640
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm644 -t ${pkgdir}/etc/pure-ftpd/ configuration-file/pure-ftpd.conf ${srcdir}/welcome.msg
	install -Dm755 configuration-file/pure-config.pl ${pkgdir}/usr/bin/pure-config.pl
	install -Dm644 -t ${pkgdir}/usr/lib/systemd/system/ ${srcdir}/pure-ftpd.service
	install -Dm644 ${srcdir}/pure-ftpd.logrotate ${pkgdir}/etc/logrotate.d/pure-ftpd
	install -Dm640 -t ${pkgdir}/etc/ssl/private/ ${srcdir}/pure-ftpd.pem ${srcdir}/pure-ftpd-dhparams.pem
	install -Dm644 -t ${pkgdir}/usr/share/doc/${pkgname}/ README* pureftpd-*sql.conf
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	sed -i 's|NoAnonymous\s.*no|NoAnonymous yes|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i "/# FortunesFile/a FortunesFile \/etc\/pure-ftpd\/welcome.msg" ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|SyslogFacility\s.*ftp|SyslogFacility none|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# /usr/sbin/pure-config.pl /usr/etc/pure-ftpd.conf|# /usr/bin/pure-config.pl /etc/pure-ftpd/pure-ftpd.conf|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|#PIDFile\s.*/var/run/pure-ftpd.pid|PIDFile /run/pure-ftpd/pure-ftpd.pid|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# AltLog\s.*clf:/var/log/pureftpd.log|AltLog clf:/var/log/pureftpd.log|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# TLS\s.*1|TLS 1|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# TLSCipherSuite\s.*HIGH|TLSCipherSuite HIGH:MEDIUM:+TLSv1|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# CertFile\s.*/etc/ssl/private/pure-ftpd.pem|CertFile /etc/ssl/private/pure-ftpd.pem|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
}
