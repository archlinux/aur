# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: hexchain <i at hexchain.org>
pkgname=tpm2-abrmd
pkgver=2.0.3
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 Access Broker and Resource Management Daemon'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-abrmd'
license=('BSD')
depends=('dbus' 'glib2' 'tpm2-tss')
checkdepends=('cmocka' # for unit test suite
              'ibm-sw-tpm2' 'net-tools') # for integration test suite
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('70b431b9d09e1c1db819aabf6ca8e40a7553573339f43a6c872ad685b7822e5046bd8ede25dcd0608ce2d8fa32257f6c1dd7f234aa7d6a447ac795625d4e0fac'
            'SKIP')
validpgpkeys=('42007E876F248E04A3F2FE25AE4548D043DEC7C3') # Philip Tricca

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
	make
}

check() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --enable-unit --enable-integration
	dbus-run-session -- make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	echo 'u tss - "tpm2-abrmd sandbox user"' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
