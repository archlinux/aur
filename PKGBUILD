pkgbase=navicat-premium-lite
pkgname=("${pkgbase}-en" "${pkgbase}-zh-cn")
pkgver=18.0.3
pkgrel=3
pkgdesc="Navicat Premium Lite"
arch=('x86_64')
url="https://www.navicat.com/products/navicat-premium-lite"
license=('proprietary')
dependencies=('systemd-libs')
# upstream download urls carry the major version
_major=${pkgver%%.*}
source_x86_64=(
	"${pkgbase}-en-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat${_major}-premium-lite-en-x86_64.AppImage"
	"${pkgbase}-cs-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat${_major}-premium-lite-cs-x86_64.AppImage"
)
sha256sums_x86_64=('5562ab8297c896ab97d0e392c8ce1599c9f2840b4bf23ea0d5ef4be7949cf62c'
                   'bce833aec7b6b58b4dc381fd4e691d96946b8798d856f5288a3276655e4af8ec')

_package() {
	_lang=$1
	_app="${pkgbase}-${_lang}-${CARCH}-${pkgver}.AppImage"

	cd "$srcdir/" && rm -rf "squashfs-root"
	chmod +x "${_app}" && ./"${_app}" --appimage-extract

	_pkgroot="opt/${pkgbase}"
	_pkgroot_path="${pkgdir}/${_pkgroot}"
	install -d "${_pkgroot_path}" && cp -a "${srcdir}/squashfs-root/." "${_pkgroot_path}"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/navicat.desktop" "${pkgdir}/usr/share/applications/navicat.desktop"
	# upstream renamed the icon to a generic "icon.png" since 18.0.3
	sed -i 's/^Icon=.*/Icon=navicat-icon/' "${pkgdir}/usr/share/applications/navicat.desktop"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"
	install -dm755 "${pkgdir}/usr/bin" && ln -s "/${_pkgroot}/AppRun" "${pkgdir}/usr/bin/navicat"

	# workaround for libsystemd.so.0: version `LIBSYSTEMD_251' not found
	rm "${_pkgroot_path}"/usr/lib/libsystemd.so.0
}

package_navicat-premium-lite-en() {
	pkgdesc='Navicat Premium Lite is a compact version of Navicat'
	provides=("${pkgbase}")

	_package en
}

package_navicat-premium-lite-zh-cn() {
	pkgdesc="Navicat Premium Lite 是 Navicat 的精简版"
	provides=("${pkgbase}" "${pkgbase}-cs")

	_package cs
}
