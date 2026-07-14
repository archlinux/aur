# Maintainer: Leo <i@hardrain980.com>
pkgname=qbittorrent-enhanced-nox
pkgver=5.2.1.10
pkgrel=2
pkgdesc="A bittorrent client powered by C++, Qt and libtorrent (Enhanced Edition), w/o GUI"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'libtorrent-rasterbar' 'openssl>=3.0.2' 'qt6-base>=6.6.0' 'zlib')
makedepends=('cmake>=3.16' 'boost>=1.76' 'qt6-tools' 'qt6-svg')
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent-nox')
conflicts=('qbittorrent-nox')
source=(
	"qbittorrent-enhanced-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz"
	"qbittorrent-nox.service"
	"qbittorrent-nox.sysusers"
	"qbittorrent-nox.tmpfiles"
	'https://patch-diff.githubusercontent.com/raw/c0re100/qBittorrent-Enhanced-Edition/pull/715.patch'
)
sha256sums=(
	'ee5e05db67ba52a9380b01501260473bcd6595b4750c5775c037ed3b6815e30b'
	'SKIP'
	'SKIP'
	'SKIP'
	'c8202238e8f3933ddea5636bfb5f3c0782c78995aa7ef7f5cf6a719addbc3b8d'
)

prepare() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver
	# apply patch for libtorrent-rasterbar >= 2.1.0
	patch -Np1 -i $srcdir/715.patch
}

build() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr -DGUI=OFF -DSYSTEMD=OFF
	cmake --build build
}

package() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/qbittorrent-enhanced-nox/COPYING
	install -Dm644 "$srcdir"/qbittorrent-nox.service "$pkgdir"/usr/lib/systemd/system/qbittorrent-nox.service
	install -Dm644 "$srcdir"/qbittorrent-nox.sysusers "$pkgdir"/usr/lib/sysusers.d/qbittorrent-nox.conf
	install -Dm644 "$srcdir"/qbittorrent-nox.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/qbittorrent-nox.conf
}
