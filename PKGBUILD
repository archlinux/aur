# Maintainer: kraxarn <me@kraxarn.com>

pkgname=spotify-qt
pkgver=1.10
pkgrel=1
pkgdesc="Lightweight Spotify client using Qt"
arch=(x86_64)
url="https://github.com/kraxarn/spotify-qt"
license=("GPL3")
depends=(qt5-base qt5-svg hicolor-icon-theme)
makedepends=(git cmake gcc make)
optdepends=("spotifyd: Recommended playback client")
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=("16c055965dbd9618ece274b52b9ea4d0be233f1439c5cbd9380e0c4996346757")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGIT_TAG=v$pkgver .
	make $MAKEFLAGS
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