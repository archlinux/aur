# Maintainer: Leo <i@setuid0.dev>

pkgname=qbittorrent-enhanced-nox
pkgver=4.3.6.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt5 and the good libtorrent library (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL' 'custom')
groups=()
depends=('libtorrent-rasterbar>=1:1.2.12' 'qt5-base')
makedepends=('boost' 'qt5-tools')
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
	"COPYING::https://raw.githubusercontent.com/c0re100/qBittorrent-Enhanced-Edition/v4_3_x/COPYING"
	"qbittorrent-nox.service"
	"qbittorrent-nox.sysusers"
	"qbittorrent-nox.tmpfiles"
)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
	cd qBittorrent*$pkgver

	# tell qmake not ot break makepkg's debug/!strip options
	export QBT_ADD_CONFIG='nostrip'

	./configure --prefix=/usr --disable-gui CXXFLAGS="-std=c++17"
	make
}

package() {
	cd qBittorrent*$pkgver

	make INSTALL_ROOT="$pkgdir/" install

	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
	install -Dm644 "$srcdir"/qbittorrent-nox.service "$pkgdir"/usr/lib/systemd/system/qbittorrent-nox.service
	install -Dm644 "$srcdir"/qbittorrent-nox.sysusers "$pkgdir"/usr/lib/sysusers.d/qbittorrent-nox.conf
	install -Dm644 "$srcdir"/qbittorrent-nox.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/qbittorrent-nox.conf
}
