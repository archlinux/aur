# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: hexchain <i at hexchain.org>
pkgname=tpm2-abrmd-git
pkgver=2.0.3.r20.79b72d4
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 Access Broker and Resource Management Daemon'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-abrmd'
license=('BSD')
depends=('dbus' 'glib2' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'python')
checkdepends=('cmocka' # for unit test suite
              'ibm-sw-tpm2' 'net-tools') # for integration test suite
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf '%s' "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare () {
	cd "${pkgname%-git}"
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
	make
}

check() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --enable-unit --enable-integration
	dbus-run-session -- make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	echo 'u tss - "tpm2-abrmd sandbox user"' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
