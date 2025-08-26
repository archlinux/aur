# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
_pkgname=redisinsight
pkgname=${_pkgname}-bin
pkgver=2.70.1
pkgrel=2
pkgdesc="Redis Insight is an intuitive and efficient GUI for Redis, allowing you to interact with your databases and manage your data."
arch=('x86_64')
url='https://redis.io/insight/'
license=('custom:SSPL')
depends=(
	'libgtk-3.so'
	'nss'
	'xdg-utils'
)
makedepends=('fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_filename="Redis-Insight-linux-x86_64-${pkgver}.AppImage"
source=("${_filename}::https://download.redisinsight.redis.com/releases/${pkgver}/Redis-Insight-linux-x86_64.AppImage")
sha512sums=('84427f22fc062844609a5ebb948d7a64d5e8b11a43444acfaf966afa93639f44d35ae09363091f9f55007adbf052b3c87437b06b6afdd65408d010d8976466d1')

prepare() {
	chmod +x "${_filename}"
	./${_filename} --appimage-extract > /dev/null
	sed -i "s|^Exec=.*|Exec=\"/opt/${_pkgname}/redisinsight\" %U|" squashfs-root/redisinsight.desktop
}

package () {
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -r --no-preserve=mode squashfs-root/* "${pkgdir}/opt/${_pkgname}/"
	chmod +x \
		"${pkgdir}/opt/${_pkgname}/redisinsight" \
		"${pkgdir}/opt/${_pkgname}/chrome_crashpad_handler"

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

	# Icons
	for size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "${pkgdir}/opt/${_pkgname}/resources/resources/icons/${size}x${size}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
	done

	# Applications entry
	install -Dm644 "${pkgdir}/opt/${_pkgname}/redisinsight.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Copy license to /usr/share/licenses as per Arch packaging guidelines
	install -Dm644 "${pkgdir}/opt/${_pkgname}/resources/LICENSE.redisinsight.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# Remove duplicate files, AppImage specifc files
	rm -r \
		"${pkgdir}/opt/${_pkgname}/AppRun" \
		"${pkgdir}/opt/${_pkgname}/redisinsight.desktop" \
		"${pkgdir}/opt/${_pkgname}/redisinsight.png" \
		"${pkgdir}/opt/${_pkgname}/usr/"
}
