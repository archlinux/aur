# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=ipcalc-redhat
pkgver=1.0.3
pkgrel=3
pkgdesc="Redhat's modernized ipcalc fork with IPv6 support"
arch=('x86_64')
url="https://gitlab.com/ipcalc/ipcalc"
license=('GPL-2.0-or-later')
conflicts=('ipcalc')
depends=('glibc')
makedepends=(
	'geoip'
	'meson'
	'pkgconf'
	'ruby-erb'
	'ruby-kramdown-parser-gfm'
	'ruby-ronn'
)
optdepends=('geoip: display geoinfo for IP with -g')
source=("https://gitlab.com/ipcalc/ipcalc/-/archive/${pkgver}/ipcalc-${pkgver}.tar.gz")
sha256sums=('451f323764f37ea6057e0ade60a0473938232ab2a92b97ffdc8c4860a8c76cfc')

build() {
	cd "$srcdir/ipcalc-$pkgver"
	meson setup build \
		-Duse_maxminddb=disabled \
		-Duse_geoip=enabled \
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
