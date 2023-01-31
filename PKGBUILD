# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=bordeaux
pkgver=0.5.3
pkgrel=5
epoch=
pkgdesc="SIP telephony applidation server"
url="https://codeberg.org/gnutelephony/$pkgname"
install="$pkgname.install"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz bordeaux.service bordeaux.logrotated)
makedepends=(cmake pkgconf gcc)
depends=("libexosip2>=5.3.0" libosip2 openssl fmt)
sha256sums=('a3fa5b29608a786138ca35064843fdfe7f31d7dce90188cb8c1bcd9c80a068df' '32cd39807e9feb3abd12c8cbc24c6b1bcdf1c6a71c4550bb715f3f45f9277ff1' '462037b66755dc2991bbc1d4be962e34d2e9c11f3522246df76a69f056f4d83f') 

build() {
	cd "$srcdir/$pkgname"
	cmake \
		-DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc \
		-DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_SBINDIR=/usr/bin \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DSERVER_PREFIX_PATH=/var/lib/bordeaux \
		-DSERVER_LOGGER_PATH=/var/log/bordeaux \
		-DSERVER_CONFIG_FILE=/etc/bordeaux.conf \
		-DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir/" make install
	strip "$pkgdir"/usr/bin/bordeaux*
	strip "$pkgdir"/usr/bin/bordeaux
	gzip "$pkgdir"/usr/share/man/man*/*
	install -d -m 750 "$pkgdir"/var/log/$pkgname
	install -d -m 770 "$pkgdir"/var/lib/$pkgname
	install -dm755 ${pkgdir}/usr/lib/systemd/system
	install -m744 ${srcdir}/$pkgname.service ${pkgdir}/usr/lib/systemd/system/
	install -dm755 ${pkgdir}/etc/logritate.d
	install -Dm644 ${srcdir}/$pkgname.logrotated "$pkgdir/etc/logrotate.d/$pkgname"
}


