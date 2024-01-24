# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=superconductor-appimage
pkgver=0.11.2
pkgrel=1
pkgdesc="A playout client for Windows/Linux/macOS that will let you control CasparCG Server, BMD ATEM, OBS Studio, vMix, OSC-compatible devices, HTTP (REST)-compatible devices, and more"
arch=(x86_64)
url="https://github.com/SuperFlyTV/SuperConductor"
license=(AGPL3)
depends=(fuse2)
optdepends=('tsr-bridge: External application which handles the actual playout and control of the connected devices')
provides=(superconductor)
conflicts=(superconductor)
options=(!strip)
source=("${url}/releases/download/v${pkgver}/SuperConductor-${pkgver}-Linux-Executable.AppImage")
sha256sums=('a2dc75701c4f4733a1aea4a6a14ec58551cd4d4fc529c44c8092943100c70863')
_file="SuperConductor-Linux-Executable.AppImage"
_install_path="/opt/appimages/${_file}"

package() {
	mv "SuperConductor-${pkgver}-Linux-Executable.AppImage" "$_file"
	chmod +x "${_file}"
	mkdir -p squashfs-root/usr/share/icons/hicolor/{1024x1024,512x512,256x256,128x128,96x96,64x64,48x48,32x32,24x24,16x16}/apps
	./${_file} --appimage-extract "usr/share/icons/hicolor/*/apps/superconductor.png"
	./${_file} --appimage-extract "superconductor.desktop"
	sed -i -E "s|Exec=AppRun|Exec=${_install_path}|" "squashfs-root/superconductor.desktop"

	# Install icons
	install -dm755 "$pkgdir"/usr/share/icons
	cp -av --no-preserve=ownership squashfs-root/usr/share/icons "$pkgdir"/usr/share
	chmod -R 755 "$pkgdir"/usr/share/icons
	find "$pkgdir"/usr/share/icons -type f -name "superconductor.png" -exec chmod 644 {} \;

	# Install .desktop file and image file
	# Disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
	# Disable AppimageLauncher integration prompt
	# https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
	sed -i -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/superconductor|" "squashfs-root/superconductor.desktop"
	install -vDm644 squashfs-root/superconductor.desktop "$pkgdir"/usr/share/applications/superconductor.desktop
	install -vDm755 ${_file} "$pkgdir"/${_install_path}
	mkdir "$pkgdir"/usr/bin/ && chmod 755 "$pkgdir"/usr/bin/
	ln -s ${_install_path} "$pkgdir"/usr/bin/superconductor

	# Disable AppImage integration prompt
	# https://github.com/electron-userland/electron-builder/issues/1962
	install -dm755 "$pkgdir"/usr/share/appimagekit
}
