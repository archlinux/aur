# Maintainer: Eric Renfro <psi-jack@linux-help.org>
pkgname=clamsmtp
pkgver="1.10"
pkgrel=3
pkgdesc="SMTP filter that allows you to check for viruses using the ClamAV anti-virus software."
url="http://thewalter.net/stef/software/clamsmtp/"
license="GPL"
depends=('clamav')
source=(http://thewalter.net/stef/software/clamsmtp/$pkgname-$pkgver.tar.gz clamsmtp.confd clamsmtp.service)
backup=(etc/clamav/clamsmtpd.conf)
install=clamsmtp.install
md5sums=('b068ba6e444859782bbdd88f290c1abf'
         '1ee746fb89ae90e48b1fa268ecc29b48'
         'b55ac98624cee3d66656ba356a2b1d67')

arch=('i686' 'x86_64' 'armv6h')

build() {
	cd $startdir/src/$pkgname-$pkgver/
	./configure --prefix=/usr
	sed -i 's@#define DEFAULT_CLAMAV "/var/run/clamav/clamd"@#define DEFAULT_CLAMAV "/var/lib/clamav/clamd.sock"@g' src/clamsmtpd.c
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver/
	make DESTDIR=$pkgdir install
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	mkdir -p ${pkgdir}/etc/conf.d
	mkdir -p $pkgdir/etc/clamav
	#install -m 755 ../clamsmtp ${startdir}/pkg/etc/rc.d/
	install -m 644 ../clamsmtp.confd ${pkgdir}/etc/conf.d/clamsmtp
	install -m 644 ../clamsmtp.service ${pkgdir}/usr/lib/systemd/system/clamsmtp.service
	install -m 644 $srcdir/$pkgname-$pkgver/doc/clamsmtpd.conf $pkgdir/etc/clamav/
	sed -i 's/#User: clamav/User: clamav/g' $pkgdir/etc/clamav/clamsmtpd.conf
	sed -i 's/#ClamAddress: \/var\/run\/clamav\/clamd/ClamAddress: \/var\/lib\/clamav\/clamd.sock/g' $pkgdir/etc/clamav/clamsmtpd.conf
} 
