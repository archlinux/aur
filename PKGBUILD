# Maintainer: mapleafgo <mapleafgo@163.com>
pkgname=mqttx-appimage
pkgver=1.11.0
pkgrel=3
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
sha256sums_x86_64=('d58a50b2bb9a765743fd9f5de3ae6bb2af4592c6af9a5fdb083f69de517d8676')
sha256sums_aarch64=('dfc4c84d47db8257c99193aa1e5ff87063a28c4b8463abee44418ec4667848bb')