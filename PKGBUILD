# Based on AUR PKGBUILD for stabilitymatrix (all respective contributors apply herein)
# Maintainer: Ivan Wheeler <ivanwheeler90 at gmail dot com>

pkgname=stabilitymatrix-bin
pkgver=2.13.4
pkgrel=1
pkgdesc='Multi-Platform Package Manager for Stable Diffusion. Binary version.'
arch=('x86_64')
url='https://github.com/LykosAI/StabilityMatrix'
license=('AGPL3')
depends=('libxcrypt-compat' 'zlib')
options=('!strip')
provides=('stabilitymatrix')
conflicts=('stabilitymatrix')
source=("stabilitymatrix-${pkgver}.zip::https://github.com/LykosAI/StabilityMatrix/releases/download/v${pkgver}/StabilityMatrix-linux-x64.zip")
sha256sums=('d1d02d82977ce0cee1df2dea61cc962eb5fc1ed40b8008d100a60c8c951e5094')

build() {
	chmod +x "StabilityMatrix.AppImage"
	./StabilityMatrix.AppImage --appimage-extract > /dev/null

	# Change executable path in desktop file
	sed -i 's#/usr/bin/#/opt/stabilitymatrix/#g' squashfs-root/zone.lykos.stabilitymatrix.desktop
}

package() {
	mkdir -p "${pkgdir}/opt/stabilitymatrix"

	# Make a Data directory so that choosing portable mode doesn't error.
	mkdir -m777 "${pkgdir}/opt/stabilitymatrix/Data"

	# Install binary
	install -Dm755 "${srcdir}/squashfs-root/usr/bin/StabilityMatrix.Avalonia" "${pkgdir}/opt/stabilitymatrix/StabilityMatrix.Avalonia"

	# Desktop file and icon
	install -Dm644 "${srcdir}/squashfs-root/zone.lykos.stabilitymatrix.desktop" "${pkgdir}/usr/share/applications/zone.lykos.stabilitymatrix.desktop"
	install -Dm644 "${srcdir}/squashfs-root/zone.lykos.stabilitymatrix.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zone.lykos.stabilitymatrix.png"
}
