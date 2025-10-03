# Maintainer: lpt <aur AT lucapetrucci DOT net>

pkgname=ifupdown-ng
pkgver=0.12.1
pkgrel=3
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
	"00-ifupdown-use-ldflags.patch::$url/commit/b7909e0c681e8ddefbac97f1bc9d70324e2f637a.patch"
	"01-fix-systemd-unit.patch::$url/commit/53eaf760462204c39b5352ade160dca97961e22c.patch"
	"02-fix-config-path.patch"
	"03-remove-state-dir.patch"
)
sha256sums=(
	'd42c8c18222efbce0087b92a14ea206de4e865d5c9dde6c0864dcbb2b45f2d85'
	'4322c8578793aacad7ca32b45b5074dc03915fa9f3663983f15b11e1e2b4dd5a'
	'a6db3043ee3df57b1abb242e0e11507dc7f5f01d5cfbd22c82e97e51dc506065'
	'cca44ecf38c72afcdc38d9e4a879b07a3f34ec4fc7f0f7f00169afd8e1d439cb'
	'fe578cef61a2c95f4054e34570b9a3f6364ac3d9d5734b9535ed05895da0ecfb'
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
