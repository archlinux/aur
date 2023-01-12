# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=coventry
pkgver=0.5.7
pkgrel=2
epoch=
pkgdesc="Residential IP telephony gateway"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz coventry.service coventry.logrotated)
makedepends=(cmake pkgconf gcc)
depends=("libexosip2>=5.3.0" libosip2 openssl fmt)
sha256sums=('0fdd3cc83f9226c89e9ad9e797143f5dcf0d4fb69b58eef40e530d24d62e3ab7' 'cc86328eefcfcfc20cd5f080af06e3a5a05c069acfa11b190d457b1bd8b32ec2' 'fea6bd1f1887d3a7d14491a058e35f90d87b401b84dcd45a5d387d3f2edff0e3') 

build() {
	cd "$srcdir/$pkgname"
	cmake \
		-DCMAKE_INSTALL_FULL_SYSCONFDIR:PATH=/etc \
		-DCMAKE_INSTALL_FULL_LOCALSTATEDIR:PATH=/var \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_SBINDIR=/usr/bin \
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
	strip "$pkgdir"/usr/bin/coventry
	gzip "$pkgdir"/usr/share/man/man*/*
	install -d -m 700 "$pkgdir"/var/log/$pkgname
	install -d -m 700 "$pkgdir"/var/lib/$pkgname
	install -dm755 ${pkgdir}/usr/lib/systemd/system
	install -m744 ${srcdir}/$pkgname.service ${pkgdir}/usr/lib/systemd/system/
	install -dm755 ${pkgdir}/etc/logritate.d
	install -Dm644 ${srcdir}/$pkgname.logrotated "$pkgdir/etc/logrotate.d/$pkgname"
}


