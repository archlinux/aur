# Maintainer: kraxarn <me@kraxarn.com>

pkgname=spotify-qt
pkgver=1.5
pkgrel=1
pkgdesc="Lightweight Spotify client using Qt"
arch=(x86_64)
url="https://github.com/kraxarn/spotify-qt"
license=("GPL3")
depends=(qt5-base qt5-svg hicolor-icon-theme)
makedepends=(git cmake gcc make)
optdepends=("spotifyd: Recommended playback client")
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=("aea63d678b7d87050c0088d9403169eafe54ff8087f06c76cd7cc484b2af885a")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGIT_TAG=v$pkgver .
	make $MAKEFLAGS -j$(nproc)
}

package() {
	
	cd "$pkgname-$pkgver"
	# Install app
	make DESTDIR="$pkgdir" install
	# Install icons
	sizes=(16 24 32 48 64 96 128 256 512)
	for size in ${sizes[*]}
	do
		install -Dm644 "res/app/${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify-qt.png"
	done
	install -Dm644 "res/logo/spotify-qt.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/spotify-qt.svg"
	# Install desktop shortcut
	install -Dm644 "res/app/spotify-qt.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}