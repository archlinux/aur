# Maintainer: lpt <aur AT lucapetrucci DOT net>

pkgname=ifupdown-ng
pkgver=0.12.1
pkgrel=1
pkgdesc='Flexible ifup/ifdown implementation'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/ifupdown-ng/ifupdown-ng'
license=('custom')
depends=('libbsd')
makedepends=('scdoc')
optdepends=('sh: use default executors'
	'dhcpcd: DHCP support'
	'dhclient: DHCP support'
	'wpa_supplicant: Wi-Fi support'
	'bridge-utils: ethernet bridge support'
	'ppp: Point-to-Point Protocol support'
	'ethtool: ethtool support'
	'wireguard-tools: WireGuard VPN support'
	'batctl: B.A.T.M.A.N. support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('d42c8c18222efbce0087b92a14ea206de4e865d5c9dde6c0864dcbb2b45f2d85')

build() { 
	cd "$pkgname-$pkgname-$pkgver"
	make EXECUTOR_PATH='/usr/lib/ifupdown-ng' \
		LIBBSD_CFLAGS="$(pkg-config --cflags libbsd-overlay)" \
		LIBBSD_LIBS="$(pkg-config --cflags --libs libbsd-overlay)" \
		all docs
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make DESTDIR="$pkgdir" SBINDIR='/usr/bin' EXECUTOR_PATH='/usr/lib/ifupdown-ng' \
		install install_docs
	install -Dvm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
