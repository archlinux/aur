# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=gnupg-pkcs11-scd
pkgver=0.10.0
pkgrel=2
pkgdesc='Smart-card daemon to enable the use of PKCS#11 tokens with GnuPG'
arch=('x86_64')
url='http://gnupg-pkcs11.sourceforge.net/'
license=('BSD')
depends=('libassuan' 'libgcrypt' 'libgpg-error' 'openssl' 'pkcs11-helper')
source=("https://github.com/alonbl/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"
        'gnupg-pkcs11-scd.sysusers.conf')
sha512sums=('47b9afdc3552fc9a741a725c6732cd31cd2643d7483a50d26222d68d0557b700addff37d8598ee1076575b8bc1e1134a52e06b67d4f94dda7c90141a57ca4182'
            'e150462b8aa12f2bd30f17245f9a2ac8880029641a5a74ef3d9a7bc0618845898af4804b987e78f52a5925e346c05539fb3476fe4b64abbd86fa8ceb9271fdda')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-proxy --with-proxy-socket=/run/gnupg-pkcs11-scd-proxy/cmd \
	            --with-proxy-user=gnupg-pkcs11-scd-proxy --with-proxy-user-group=gnupg-pkcs11-scd-proxy \
	            --with-proxy-group=gnupg-pkcs11 LIBGPG_ERROR_LIBS=-lgpg-error
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 "gnupg-pkcs11-scd-proxy/gnupg-pkcs11-scd-proxy.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/gnupg-pkcs11-scd.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
