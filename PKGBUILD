# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=coventry
pkgver=0.5.3
pkgrel=1
epoch=
pkgdesc="Residential IP telephony gateway"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::https://codeberg.org/gnutelephony/$pkgname/archive/v$pkgver.tar.gz coventry.service coventry.logrotated)
makedepends=(cmake pkgconf gcc)
depends=("libexosip2>=5.3.0" libosip2 openssl fmt)
sha256sums=('01854ba8ef4a2f5279bf08c1b4abbf10e88789a9013c65e4643243f775be647e' 'cf282223f8b94f90b34f58de8e8a290e5cf825d725850f3628cb7f88b3e91270' '767f5482dad17984db8c240d085218fd906c5a9ea2a6532466ab07c63b4ff5ac') 

build() {
	cd "$srcdir/$pkgname"
	cmake \
		-DCMAKE_INSTALL_FULL_SYSCONFDIR:PATH=/etc \
		-DCMAKE_INSTALL_FULL_LOCALSTATEDIR:PATH=/var \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DSERVER_PREFIX_PATH=/var/lib/coventry \
		-DSERVER_LOGGER_PATH=/var/log/coventry \
		-DSERVER_CONFIG_FILE=/etc/coventry.conf \
		-DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir/" make install
	strip "$pkgdir"/usr/bin/pbx-*
	strip "$pkgdir"/usr/sbin/coventry
	gzip "$pkgdir"/usr/share/man/man*/*
	install -d -m 700 "$pkgdir"/var/log/$pkgname
	install -d -m 700 "$pkgdir"/var/lib/$pkgname
	install -dm755 ${pkgdir}/usr/lib/systemd/system
	install -m744 ${srcdir}/$pkgname.service ${pkgdir}/usr/lib/systemd/system/
	install -dm755 ${pkgdir}/etc/logritate.d
	install -Dm644 ${srcdir}/$pkgname.logrotated "$pkgdir/etc/logrotate.d/$pkgname"
}


