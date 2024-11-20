# Maintainer: Leo <i@setuid0.dev>

pkgname=qbittorrent-enhanced-nox
pkgver=5.0.2.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt and libtorrent (Enhanced Edition), w/o GUI"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL-2.0-or-later')
groups=()
depends=('gcc-libs' 'glibc' 'libtorrent-rasterbar>=1:2.0' 'openssl' 'qt6-base' 'zlib')
makedepends=('cmake' 'boost>1.65.0' 'qt6-tools' 'qt6-svg')
checkdepends=()
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent-nox')
conflicts=('qbittorrent-nox')
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"qbittorrent-enhanced-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz"
	"qbittorrent-nox.service"
	"qbittorrent-nox.sysusers"
	"qbittorrent-nox.tmpfiles"
)
noextract=()
sha256sums=(
	'425753dcdcca1a40da2996343a8ce22b45797cf4d7305db897bf61bcb56685f5'
	'SKIP'
	'SKIP'
	'SKIP'
)

build() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DGUI=OFF \
		-DSYSTEMD=OFF
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
