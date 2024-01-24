# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=tsr-bridge-appimage
pkgver=0.11.2
pkgrel=1
pkgdesc="The TSR-bridge is the application which handles the actual playout and control of the connected devices. By default, an instance of TSR-bridge runs internally in SuperConductor, so devices can be controlled directly from the application"
arch=('x86_64')
url="https://github.com/SuperFlyTV/SuperConductor"
license=('AGPL3')
depends=('fuse2' 'superconductor')
provides=('tsr-bridge')
conflicts=('tsr-bridge')
options=(!strip)
source=("${url}/releases/download/v${pkgver}/TSR-Bridge-${pkgver}-Linux-Executable.AppImage")
sha256sums=('545461f6a068f8365b946e2e18191e0fd665a89111da879f36988da71ab6f37e')
_file="TSR-Bridge-Linux-Executable.AppImage"
_install_path="/opt/appimages/${_file}"

package() {
	mv "TSR-Bridge-${pkgver}-Linux-Executable.AppImage" "$_file"
	chmod +x "${_file}"
	mkdir -p squashfs-root/usr/share/icons/hicolor/{256x256,128x128,64x64,48x48,32x32,16x16}/apps
	./${_file} --appimage-extract "usr/share/icons/hicolor/*/apps/tsr-bridge.png"
	./${_file} --appimage-extract "tsr-bridge.desktop"
	sed -i -E "s|Exec=AppRun|Exec=${_install_path}|" "squashfs-root/tsr-bridge.desktop"

	# Install icons
	install -dm755 "$pkgdir"/usr/share/icons
	cp -av --no-preserve=ownership squashfs-root/usr/share/icons "$pkgdir"/usr/share
	chmod -R 755 "$pkgdir"/usr/share/icons
	find "$pkgdir"/usr/share/icons -type f -name "tsr-bridge.png" -exec chmod 644 {} \;

	# Install .desktop file and image file
	# Disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
	# Disable AppimageLauncher integration prompt
	# https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
	sed -i -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/tsr-bridge|" "squashfs-root/tsr-bridge.desktop"
	install -vDm644 squashfs-root/tsr-bridge.desktop "$pkgdir"/usr/share/applications/tsr-bridge.desktop
	install -vDm755 ${_file} "$pkgdir"/${_install_path}
	mkdir "$pkgdir"/usr/bin/ && chmod 755 "$pkgdir"/usr/bin/
	ln -s ${_install_path} "$pkgdir"/usr/bin/tsr-bridge

	# Disable AppImage integration prompt
	# https://github.com/electron-userland/electron-builder/issues/1962
	install -dm755 "$pkgdir"/usr/share/appimagekit
}
