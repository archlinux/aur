# Maintainer: mapleafgo <mapleafgo@163.com>
pkgname=mqttx-appimage
pkgver=1.12.1
pkgrel=1
pkgdesc="A Powerful and All-in-One MQTT 5.0 client toolbox for Desktop, CLI and WebSocket."
arch=('x86_64' 'aarch64')
url="https://github.com/emqx/MQTTX"
license=('Apache 2.0')
conflicts=('mqttx-bin'
		'mqttx-git'
		'mqttx-clean-bin')
source_x86_64=(${pkgname}-${pkgver}-x86_64.AppImage::https://github.com/emqx/MQTTX/releases/download/v${pkgver}/MQTTX-${pkgver}.AppImage)
source_aarch64=(${pkgname}-${pkgver}-aarch64.AppImage::https://github.com/emqx/MQTTX/releases/download/v${pkgver}/MQTTX-${pkgver}-arm64.AppImage)
_install_path="/opt/mqttx"
_app="${pkgname}-${pkgver}-${CARCH}.AppImage"

package() {
	cd "${srcdir}" && rm -rf "squashfs-root"

	chmod +x "${_app}" && ./"${_app}" --appimage-extract > /dev/null
	sed -i "/^Exec=/c\Exec=/usr/bin/mqttx %U" "${srcdir}/squashfs-root/mqttx.desktop"

	_pkgroot_path="${pkgdir}/${_install_path}"
	install -d "${_pkgroot_path}" && cp -a "${srcdir}/squashfs-root/." "${_pkgroot_path}" && chmod -R 755 "${_pkgroot_path}"
	install -Dm644 "${srcdir}/squashfs-root/mqttx.desktop" "${pkgdir}/usr/share/applications/mqttx.desktop"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/mqttx.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mqttx.png"
	install -dm755 "${pkgdir}/usr/bin" && ln -sf "${_install_path}/AppRun" "${pkgdir}/usr/bin/mqttx"
}
sha256sums_x86_64=('4d4b56da17888d307e99bf14f2ff7449acfdf1a9616b76858ea1e8b565b8b60c')
sha256sums_aarch64=('21fc4faebe158d21853968eba62c30abd38a437dc9d5820928ad082c5f674d7c')