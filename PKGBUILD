# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: spapanik21
# Contributor: kleph
# Contributor: fila pruda.com
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=pure-ftpd
pkgver=1.0.45
pkgrel=1
pkgdesc="A secure, production-quality and standard-conformant FTP server, focused on efficiency and ease of use."
arch=('i686' 'x86_64')
url="http://www.pureftpd.org/"
license=('custom')
depends=('openssl' 'libmariadbclient')
conflicts=('pure-ftpd-db')
backup=('etc/pure-ftpd/pure-ftpd.conf')
install=pure-ftpd.install
source=("http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${pkgver}.tar.bz2"
	'pure-ftpd.service'
	'pure-ftpd.logrotate'
	'welcome.msg'
	'pure-ftpd.install' )

md5sums=('0e7ce6816586c87a5f2707d902bc5b53'
         '0d0845e17607ffb212eae0112c58e9ff'
         '37a45c88a0f038de37b4a87c6c447534'
         '7e91835f7e7975bd0536648fc99e5a22'
         'ff95d5cb24ee8a4e26e9f56699dc4457')

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
	install -Dm644 -t ${pkgdir}/etc/pure-ftpd/ pure-ftpd.conf ${srcdir}/welcome.msg
	install -Dm644 -t ${pkgdir}/usr/lib/systemd/system/ ${srcdir}/pure-ftpd.service
	install -Dm644 ${srcdir}/pure-ftpd.logrotate ${pkgdir}/etc/logrotate.d/pure-ftpd
	install -Dm644 -t ${pkgdir}/usr/share/doc/${pkgname}/ README* pureftpd-*sql.conf ChangeLog
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	sed -i 's|NoAnonymous\s.*no|NoAnonymous yes|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i "/# FortunesFile/a FortunesFile \/etc\/pure-ftpd\/welcome.msg" ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|SyslogFacility\s.*ftp|SyslogFacility none|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|#PIDFile\s.*/var/run/pure-ftpd.pid|PIDFile /run/pure-ftpd.pid|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# AltLog\s.*clf:/var/log/pureftpd.log|AltLog clf:/var/log/pureftpd.log|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# TLS\s.*1|TLS 1|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# TLSCipherSuite\s.*HIGH|TLSCipherSuite -S:HIGH:MEDIUM:+TLSv1|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
}
