# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=coventry
pkgver=0.7.5
pkgrel=1
epoch=
pkgdesc="Residential IP telephony gateway"
url="https://codeberg.org/gnutelephony/$pkgname"
install="$pkgname.install"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz coventry.service coventry.logrotated)
makedepends=(cmake pkgconf gcc)
depends=("libexosip2>=5.3.0" libosip2 openssl fmt)
sha256sums=('dd24004a703fc864f90801269185a358fd39be4c5d12098f0ffe0f8676937477'
            'c39e795a4d006504a4efcb5cec492a7b5adb989aa75b3ab281d0319b4b00079c'
            'fea6bd1f1887d3a7d14491a058e35f90d87b401b84dcd45a5d387d3f2edff0e3')

build() {
	cd "$srcdir/$pkgname"
	cmake \
		-DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc \
		-DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var \
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
	install -d -m 750 "$pkgdir"/var/log/$pkgname
	install -d -m 770 "$pkgdir"/var/lib/$pkgname
	install -dm755 ${pkgdir}/usr/lib/systemd/system
	install -m744 ${srcdir}/$pkgname.service ${pkgdir}/usr/lib/systemd/system/
	install -dm755 ${pkgdir}/etc/logritate.d
	install -Dm644 ${srcdir}/$pkgname.logrotated "$pkgdir/etc/logrotate.d/$pkgname"
}


