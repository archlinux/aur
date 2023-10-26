# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=superconductor-appimage
pkgver=0.11.1
pkgrel=1
pkgdesc="A playout client for Windows/Linux/macOS that will let you control CasparCG Server, BMD ATEM, OBS Studio, vMix, OSC-compatible devices, HTTP (REST)-compatible devices, and more"
arch=('x86_64')
url="https://github.com/SuperFlyTV/SuperConductor"
license=('AGPL3')
depends=('fuse2')
provides=('superconductor')
conflicts=('superconductor')
options=(!strip)
source=("SuperConductor-Linux-Executable.AppImage::${url}/releases/download/v${pkgver}/SuperConductor-${pkgver}-Linux-Executable.AppImage"
	"TSR-Bridge-Linux-Executable.AppImage::${url}/releases/download/v${pkgver}/TSR-Bridge-${pkgver}-Linux-Executable.AppImage")
sha256sums=('0bd521bbaecc623f1a1721ee416a66c2f13cc971e217e87188e8835d8c5436ec'
            '9b1041c5dab8234125d9e0cdc58935f559ad60674131bc2d7bd59a0319379c6e')
_file1="SuperConductor-Linux-Executable.AppImage"
_file2="TSR-Bridge-Linux-Executable.AppImage"
_install_path1="/opt/appimages/${_file1}"
_install_path2="/opt/appimages/${_file2}"

package() {
	# SuperConductor
	chmod +x "${_file1}"
	mkdir -p squashfs-root/usr/share/icons/hicolor/{1024x1024,512x512,256x256,128x128,96x96,64x64,48x48,32x32,24x24,16x16}/apps
	./${_file1} --appimage-extract "usr/share/icons/hicolor/*/apps/superconductor.png"
	./${_file1} --appimage-extract superconductor.desktop
	sed -i -E "s|Exec=AppRun|Exec=${_install_path1}|" "squashfs-root/superconductor.desktop"

	# TSR-Bridge
	chmod +x "${_file2}"
	./${_file2} --appimage-extract "usr/share/icons/hicolor/*/apps/tsr-bridge.png"
	./${_file2} --appimage-extract tsr-bridge.desktop
	sed -i -E "s|Exec=AppRun|Exec=${_install_path2}|" "squashfs-root/tsr-bridge.desktop"

	# Install icons
	install -dm755 "$pkgdir"/usr/share/icons
	cp -dpr --no-preserve=ownership squashfs-root/usr/share/icons "$pkgdir"/usr/share
	chmod -R 755 "$pkgdir"/usr/share/icons
	find "$pkgdir"/usr/share/icons -type f -name "superconductor.png" -exec chmod 644 {} \;
	find "$pkgdir"/usr/share/icons -type f -name "tsr-bridge.png" -exec chmod 644 {} \;

	# Install .desktop file and image file
	# Disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
	# Disable AppimageLauncher integration prompt
	# https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
	# SuperConductor
	sed -i -E "s|Exec=${_install_path1}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/superconductor|" "squashfs-root/superconductor.desktop"
	install -Dm644 squashfs-root/superconductor.desktop "$pkgdir"/usr/share/applications/superconductor.desktop
	install -Dm755 ${_file1} "$pkgdir"/${_install_path1}
	mkdir "$pkgdir"/usr/bin/ && chmod 755 "$pkgdir"/usr/bin/
	ln -s ${_install_path1} "$pkgdir"/usr/bin/superconductor
	# TSR-Bridge
	sed -i -E "s|Exec=${_install_path2}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/tsr-bridge|" "squashfs-root/tsr-bridge.desktop"
	install -Dm644 squashfs-root/tsr-bridge.desktop "$pkgdir"/usr/share/applications/tsr-bridge.desktop
	install -Dm755 ${_file2} "$pkgdir"/${_install_path2}
	ln -s ${_install_path2} "$pkgdir"/usr/bin/tsr-bridge

	# Disable AppImage integration prompt
	# https://github.com/electron-userland/electron-builder/issues/1962
	install -dm755 "$pkgdir"/usr/share/appimagekit
}
