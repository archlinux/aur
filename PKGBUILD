# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alvr-launcher-bin
_pkgname=${pkgname%-bin}
pkgver=20.14.1
pkgrel=1
pkgdesc="Launcher for ALVR. Stream VR games from your PC to your headset via Wi-Fi."
arch=('x86_64')
url="https://github.com/alvr-org/ALVR"
license=('MIT')
depends=('hicolor-icon-theme')
makedepends=('imagemagick')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/alvr-org/ALVR/releases/download/v$pkgver/${_pkgname%-launcher}_launcher_linux.tar.gz"
		"${_pkgname}.png"
		"${_pkgname}.desktop")
md5sums=('9c5656b9e41b810fd4a8026b59c65467'
         'cd2c37fd286efad87b679d50631ca3d7'
         '7467d29e1ea2a23a27f5608c7f62afb9')

build() {
	cd "$srcdir/${_pkgname%-launcher}_launcher_linux"

	for res in 16x16 32x32 48x48 64x64 128x128 256x256; do
		mkdir -p "icons/hicolor/${res}/apps/"
		magick "$srcdir/${_pkgname}.png" -thumbnail "${res}" -alpha on -background none -flatten "./icons/hicolor/${res}/apps/${_pkgname}.png"
	done
}

package() {
	cd "$srcdir/${_pkgname%-launcher}_launcher_linux"
	mv "ALVR Launcher" ${_pkgname}
	install -Dm755 alvr-launcher -t "$pkgdir/usr/bin/"

	# Desktop
	install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

	# Icons
	install -d "$pkgdir/usr/share/icons/hicolor/"{16x16,32x32,48x48,64x64,128x128,256x256}/apps/
	cp -ar icons/* "$pkgdir/usr/share/icons/"
}
