# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=iptvnator-appimage
pkgver=0.14.0
pkgrel=2
pkgdesc="Cross-platform IPTV player app, supports m3u+m3u8 playlists, favorites, TV guide, TV archive/catchup and more"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/4gray/iptvnator/"
license=('MIT')
depends=('fuse2' 'mpv')
provides=("iptvnator-appimage=${pkgver}")
conflicts=('iptvnator-appimage' 'iptvnator-bin')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source_x86_64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}.AppImage")
source_aarch64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-arm64.AppImage")
source_armv7h=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-armv7l.AppImage")
sha256sums_x86_64=('e7d9f5e9f666eda4be74c986ec65f879c8ad2ffde08102cc79262ef4e6897c0b')
sha256sums_aarch64=('912fbc09b0bf660470d09c88ecceaed5430b9f7a8ca0052fe8ec0209dd57d131')
sha256sums_armv7h=('4de76fe4a4d3d69a47286e1f7a86834dbf841ec1749a6584f201b0e6725a91e9')
[ $CARCH = "x86_64" ] && _image="$(basename "${source_x86_64[0]}")"
[ $CARCH = "aarch64" ] && _image="$(basename "${source_aarch64[0]}")"
[ $CARCH = "armv7h" ] && _image="$(basename "${source_armv7h[0]}")"
_filename="${_image}"
_squashfs_desktop_file="iptvnator.desktop"
_desktop_file="/usr/share/applications/iptvnator.desktop"
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/${_appimage_name}"

package() {
	chmod +x "${_filename}"
	mkdir -p squashfs-root/usr/share/icons/hicolor/{1024x1024,512x512,16x16}/apps
	./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/iptvnator.png"
	./${_filename} --appimage-extract iptvnator.desktop
	sed -i -E "s|Exec=AppRun|Exec=${_install_path}|" "squashfs-root/${_squashfs_desktop_file}"

	# Install icons
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
	chmod -R 755 "${pkgdir}/usr/share/icons"
	find "${pkgdir}/usr/share/icons" -type f -name "iptvnator.png" -exec chmod 644 {} \;

	# Install .desktop file and image file
	# Disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
	# Disable AppimageLauncher integration prompt
	# https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
	sed -i -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/iptvnator|" "squashfs-root/${_squashfs_desktop_file}"
	install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
	install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
	mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
	ln -s "${_install_path}" "${pkgdir}/usr/bin/iptvnator"

	# Disable AppImage integration prompt
	# https://github.com/electron-userland/electron-builder/issues/1962
	install -dm755 "${pkgdir}/usr/share/appimagekit"
}
