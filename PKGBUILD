# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: kleph <kleph at kleph dot info>
# Contributor: spapanik21
# Contributor: fila pruda.com
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=pure-ftpd
pkgver=1.0.47
pkgrel=3
pkgdesc="A secure, production-quality and standard-conformant FTP server, focused on efficiency and ease of use."
arch=('i686' 'x86_64')
url="https://www.pureftpd.org/"
license=('custom')
depends=('openssl' 'mariadb-libs')
conflicts=('pure-ftpd-db')
backup=('etc/pure-ftpd/pure-ftpd.conf')
install=pure-ftpd.install
source=("https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${pkgver}.tar.bz2"
	'pure-ftpd.service'
	'pure-ftpd.logrotate'
	'welcome.msg'
	'tls1_3.patch'
	'pure-ftpd.install' )

md5sums=('a41fa531c0d21bd3416dd524d75495ae'
         '0d0845e17607ffb212eae0112c58e9ff'
         '37a45c88a0f038de37b4a87c6c447534'
         '7e91835f7e7975bd0536648fc99e5a22'
         '85799b3cce0ca37b035269fef6939c2b'
         'c80cbd3ae1f9915f686f84149f6293e5')

prepare() {
	cd $pkgname-$pkgver
	patch -Np0 -i "${srcdir}/tls1_3.patch"
}

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
	sed -i 's/define MAX_DATA_SIZE (40/define MAX_DATA_SIZE (70/' src/ftpd.h
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm644 -t ${pkgdir}/etc/pure-ftpd/ pure-ftpd.conf ${srcdir}/welcome.msg
	rm -f ${pkgdir}/etc/pure-ftpd.conf
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
