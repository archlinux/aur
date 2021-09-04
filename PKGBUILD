# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=('spy' 'spy-dkms')
pkgbase=spy
pkgver=1.8
pkgrel=1
pkgdesc="Linux kernel mode debugfs keylogger"
arch=('x86_64')
url="https://github.com/jarun/spy"
license=('GPL')
makedepends=('linux-headers')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'dkms.conf')
sha256sums=('d9c31d3df9a1b7974327796b505d77d04045a72a5d40a52ba24a065fdeb9c11a'
            'e38cea0298e505875e2f9049ae7bbdfbff0e897f4e1f767bdf3f7a5675c77a75')

prepare() {
	sed -e "s/@PKGBASE@/$pkgbase/" -e "s/@PKGVER@/$pkgver/" -i dkms.conf
}

build() {
	cd "$pkgbase-$pkgver"
	make
}

package_spy() {
	local _kver="$(uname -r)"
	local _modname=kisni

	cd "$pkgbase-$pkgver"
	install -Dm755 "$_modname.ko" -t "$pkgdir/usr/lib/modules/$_kver/misc/$_modname/"
}

package_spy-dkms() {
	# options and directives overrides
	pkgdesc+=' -- DKMS version'
	depends=('dkms')
	provides=('spy')
	conflicts=('spy')

	cd "$pkgbase-$pkgver"
	install -Dm 644 -t "$pkgdir/usr/src/$pkgbase-$pkgver" Makefile spy.c "$srcdir/dkms.conf"
}
