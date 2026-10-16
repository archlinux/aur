# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=ipcalc-redhat
pkgver=1.2.0
pkgrel=1
pkgdesc="Redhat's modernized ipcalc fork with IPv6 support"
arch=('x86_64')
url="https://gitlab.com/ipcalc/ipcalc"
license=('GPL-2.0-or-later')
conflicts=('ipcalc')
depends=('glibc')
makedepends=(
	'jq'
	'libmaxminddb'
	'meson'
	'pkgconf'
	'ruby-ronn'
)
optdepends=('libmaxminddb: display geoinfo for IP with -g')
source=("https://gitlab.com/ipcalc/ipcalc/-/archive/${pkgver}/ipcalc-${pkgver}.tar.gz")
sha256sums=('f6fc9076d3f1a64d1e050e1d6edd3fd61b91db71d0dfa1d9d184618e81865747')

build() {
	cd "$srcdir/ipcalc-$pkgver"
	meson setup build \
		-Duse_maxminddb=enabled \
		-Duse_runtime_linking=enabled
	ninja -C build
}

check() {
	cd "$srcdir/ipcalc-$pkgver"
	ninja -C build test
}

package() {
	cd "$srcdir/ipcalc-$pkgver"
	install -m755 -Dt "${pkgdir}/usr/bin/" build/ipcalc
	install -m644 -Dt "${pkgdir}/usr/share/man/man1/" build/ipcalc.1
}
