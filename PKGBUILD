# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
_pkgname=redisinsight
pkgname=${_pkgname}-bin
pkgver=2.54.0
pkgrel=1
pkgdesc="Redis Insight is an intuitive and efficient GUI for Redis, allowing you to interact with your databases and manage your data."
arch=('x86_64')
url='https://redis.com/redis-enterprise/redis-insight'
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
sha512sums=('cef95e5e4be7f4edae2a5d61e90d9195a834b6517c62e1e02ffabe00195a324cec9bcf52695c619e0915f06ec132565f243f41cb5f4dd49be29087d1230ec612')

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
