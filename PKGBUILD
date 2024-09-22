# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alvr-launcher-bin
_pkgname=${pkgname%-launcher-bin}
pkgver=20.11.1
pkgrel=1
pkgdesc="Launcher for ALVR. Stream VR games from your PC to your headset via Wi-Fi."
arch=('x86_64')
url="https://github.com/alvr-org/ALVR"
license=('MIT')
groups=()
depends=('vulkan-icd-loader' 'bash' 'hicolor-icon-theme' 'libpipewire')
makedepends=('tar' 'imagemagick')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/alvr-org/ALVR/releases/download/v$pkgver/${_pkgname}_launcher_linux.tar.gz"
		"${_pkgname}.png"
		"${_pkgname}.desktop")
md5sums=('50eca1495c67f30a3ae7447a86dbef92'
         'cd2c37fd286efad87b679d50631ca3d7'
         '40ca0cecd6acc0bdd93da89eefb7e137')

build() {
	cd "$srcdir/${_pkgname}_launcher_linux"

	for res in 16x16 32x32 48x48 64x64 128x128 256x256; do
		mkdir -p "icons/hicolor/${res}/apps/"
		magick "$srcdir/alvr.png" -thumbnail "${res}" -alpha on -background none -flatten "./icons/hicolor/${res}/apps/alvr.png"
	done
}

package() {
	cd "$srcdir/${_pkgname}_launcher_linux"
	mv "ALVR Launcher" alvr-launcher
	install -Dm755 alvr-launcher -t "$pkgdir/usr/bin/"

	# Desktop
	install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

	# Icons
	install -d "$pkgdir/usr/share/icons/hicolor/"{16x16,32x32,48x48,64x64,128x128,256x256}/apps/
	cp -ar icons/* "$pkgdir/usr/share/icons/"
}
