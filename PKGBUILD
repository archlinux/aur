# Maintainer: Leo <i@setuid0.dev>

pkgname=qbittorrent-enhanced-nox
pkgver=4.6.1.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt and the good libtorrent library (Enhanced Edition), w/o GUI"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL' 'custom')
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
	"$pkgname-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz"
	"qbittorrent-nox.service"
	"qbittorrent-nox.sysusers"
	"qbittorrent-nox.tmpfiles"
)
noextract=()
sha256sums=(
	'e140f4434e5c91d466930ecf3f9bd8d2390ebfe1802e1933dde70eb280fb41e5'
	'SKIP'
	'SKIP'
	'SKIP'
)

build() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT6=ON \
		-DGUI=OFF \
		-DSYSTEMD=OFF
	cmake --build build
}

package() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
	install -Dm644 "$srcdir"/qbittorrent-nox.service "$pkgdir"/usr/lib/systemd/system/qbittorrent-nox.service
	install -Dm644 "$srcdir"/qbittorrent-nox.sysusers "$pkgdir"/usr/lib/sysusers.d/qbittorrent-nox.conf
	install -Dm644 "$srcdir"/qbittorrent-nox.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/qbittorrent-nox.conf
}
