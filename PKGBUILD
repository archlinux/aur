# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: kleph <kleph at kleph dot info>
# Contributor: spapanik21
# Contributor: fila pruda.com
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=pure-ftpd
pkgver=1.0.51
pkgrel=1
pkgdesc="A secure, production-quality and standard-conformant FTP server, focused on efficiency and ease of use."
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://www.pureftpd.org/"
license=('custom')
depends=('openssl' 'mariadb-libs' 'libsodium')
conflicts=('pure-ftpd-db')
backup=('etc/pure-ftpd/pure-ftpd.conf')
install=pure-ftpd.install
source=("https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${pkgver}.tar.bz2"
	'pure-ftpd.service'
	'pure-ftpd.logrotate'
	'welcome.msg'
	'pure-ftpd.install' )

sha1sums=('cda46a044e187f9914f4c7df38924375da8f2c67'
          'a7463d41bb3be097fdaa0c564b9c34c4196691b2'
          '24f8d4b2555c996c6161d120d539e3e28d8c776c'
          '2a9cc90e5c8e378e0e4c3739effccaebc73a6da2'
          '5009d1b8dd9a415eb0a051ba2e48d58b01c7a1b3')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr \
	--bindir=/usr/bin \
	--sbindir=/usr/bin \
	--with-puredb \
	--with-pam \
	--with-ftpwho \
	--with-altlog \
	--with-cookie \
	--with-mysql \
	--with-diraliases \
	--with-quotas \
	--with-peruserlimits \
	--with-throttling \
	--with-tls \
	--with-rfc2640 \
	--with-virtualchroot
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
