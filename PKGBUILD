# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: hexchain <i at hexchain.org>

pkgname=tpm2-abrmd
pkgver=2.0.2
pkgrel=1
pkgdesc='TPM2 Access Broker & Resource Management Daemon'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-abrmd'
license=('BSD')
depends=('dbus' 'glib2' 'tpm2-tss>=2.0.0')
checkdepends=('cmocka>=1.0.0' # for unit test suite
              'ibm-sw-tpm2' 'net-tools') # for integration test suite
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc}
        "tss.sysusers")
sha256sums=('18d407d6752d1d3af9a1bc811074708e9873024eb661be8d50759b3d26ffba5f'
            'SKIP'
            '67d89be143dc129a95b0c1a42b3e92367a151289fb6c0655c054fccd62cd9a0e')
validpgpkeys=('42007E876F248E04A3F2FE25AE4548D043DEC7C3') # Philip Tricca

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc GDBUS_CODEGEN=/usr/bin/gdbus-codegen
	make
}

check() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc GDBUS_CODEGEN=/usr/bin/gdbus-codegen --enable-unit --enable-integration
	dbus-run-session -- make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$srcdir"
	install -Dm644 "tss.sysusers" "$pkgdir/usr/lib/sysusers.d/tss.conf"
}
