# Contributor: Immae <ismael.bouya@normalesup.org>
# Contributor: fila pruda.com
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>

# Maintainer: Immae <ismael.bouya@normalesup.org>
pkgname=pure-ftpd-db
_srcname=pure-ftpd
pkgver=1.0.43
pkgrel=1
pkgdesc="A fast, production quality, standards-conformant FTP server. Compiled with mysql and pgsql."
arch=('i686' 'x86_64')
url="http://www.pureftpd.org/"
license=('custom')
changelog="$pkgname.changelog"
provides=('pure-ftpd')
conflicts=('pure-ftpd')
depends=('openssl' 'postgresql' 'libmariadbclient')
backup=('etc/pure-ftpd/pure-ftpd.conf')
source=("ftp://pureftpd.org/pub/${_srcname}/releases/${_srcname}-${pkgver}.tar.bz2"
	'pure-ftpd.service')



build() {
	cd ${srcdir}/${_srcname}-${pkgver}
	./configure --prefix=/usr \
	   --bindir=/usr/bin \
	   --sbindir=/usr/bin \
	   --with-puredb \
	   --with-ftpwho \
	   --with-altlog \
	   --with-tls \
	   --with-pgsql \
	   --with-mysql \
	   --with-quotas
	make
}

package() {
	cd ${srcdir}/${_srcname}-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm644 ${srcdir}/pure-ftpd.service ${pkgdir}/usr/lib/systemd/system/pure-ftpd.service
	
	install -Dm644 configuration-file/pure-ftpd.conf ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|#PIDFile                     /var/run/pure-ftpd.pid|PIDFile                     /run/pure-ftpd.pid|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|# /usr/sbin/pure-config.pl /usr/etc/pure-ftpd.conf|# /usr/bin/pure-config.pl /etc/pure-ftpd.conf|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	sed -i 's|/etc/pureftpd|/etc/pure-ftpd/pureftpd|' ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	
	install -Dm755 configuration-file/pure-config.pl ${pkgdir}/usr/bin/pure-config.pl
	
	#install license
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${_srcname}/LICENSE
	
	#install doc
	install -d ${pkgdir}/usr/share/doc/${_srcname}/
	install -Dm644 -t ${pkgdir}/usr/share/doc/${_srcname}/ README* pureftpd-*sql.conf
	
}
md5sums=('685498474a47340e9a3eae1518cf83c8'
         'b6989f475edef34f2810646cc73b7b9e')

