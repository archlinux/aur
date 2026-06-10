# Maintainer: lpt <aur AT lucapetrucci DOT net>

pkgname=ifupdown-ng
pkgver=0.13.0
pkgrel=1
pkgdesc='Flexible ifup/ifdown implementation'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/ifupdown-ng/ifupdown-ng'
license=('custom')
depends=('libbsd')
makedepends=('scdoc')
optdepends=(
	'sh: use default executors'
	'dhcpcd: DHCP support'
	'dhclient: DHCP support'
	'wpa_supplicant: Wi-Fi support'
	'bridge-utils: ethernet bridge support'
	'ppp: Point-to-Point Protocol support'
	'ethtool: ethtool support'
	'wireguard-tools: WireGuard VPN support'
	'batctl: B.A.T.M.A.N. support'
)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz"
	"00-use-shared-libs.patch"
	"01-change-config-path.patch"
	"02-remove-state-dir.patch"
)

sha256sums=(
	'9efc4c47d0baa9611fccfc428862d7da94a96ac7769efc4a7935a106ac5d3896'
	'20f4a97b0a750d9913679b536b3d3b2c5425317cb1410f9cb1126d02cdf2230e'
	'cca44ecf38c72afcdc38d9e4a879b07a3f34ec4fc7f0f7f00169afd8e1d439cb'
	'5adea46e5bbb71845696b3f79eec8ec2d84ef72ce7b13b3f7f302f0a396bcaed'
)

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
	for patch in "$srcdir"/*.patch; do
		patch -Np1 -i "${patch}"
	done
}

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
	install -Dvm644 dist/debian/ifupdown-ng.networking.service "$pkgdir/usr/lib/systemd/system/ifupdown-ng.service"
	install -Dvm755 dist/debian/networking "$pkgdir/usr/share/ifupdown-ng/sbin/networking"
	install -Dvm644 dist/debian/networking.default "$pkgdir/etc/default/ifupdown-ng"
}
