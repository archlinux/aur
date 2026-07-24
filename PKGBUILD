pkgbase=navicat-premium-lite
pkgname=("${pkgbase}-en" "${pkgbase}-zh-cn")
pkgver=17.3.10
pkgrel=1
pkgdesc="Navicat Premium Lite"
arch=('x86_64')
url="https://www.navicat.com/products/navicat-premium-lite"
license=('proprietary')
dependencies=('systemd-libs')
source_x86_64=(
	"${pkgbase}-en-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-en-x86_64.AppImage"
	"${pkgbase}-cs-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-cs-x86_64.AppImage"
)
sha256sums_x86_64=('37116265c9ce389e1d804cbf9a35deb4c76221ebf134fcf015aa63f141e9f399'
                   '97519ae417f4431756c28d46611fc191321874783b536395758c57b31062060d')

_package() {
	_lang=$1
	_app="${pkgbase}-${_lang}-${CARCH}-${pkgver}.AppImage"

	cd "$srcdir/" && rm -rf "squashfs-root"
	chmod +x "${_app}" && ./"${_app}" --appimage-extract

	_pkgroot="opt/${pkgbase}"
	_pkgroot_path="${pkgdir}/${_pkgroot}"
	install -d "${_pkgroot_path}" && cp -a "${srcdir}/squashfs-root/." "${_pkgroot_path}"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/navicat.desktop" "${pkgdir}/usr/share/applications/navicat.desktop"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"
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
