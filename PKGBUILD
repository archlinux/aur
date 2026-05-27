# Maintainer: Dessyume <dess@dessyu.me>

_pkgname=nerimity-desktop
pkgname=nerimity
pkgdesc="A modern and sleek chat app."
pkgver=1.3.1
pkgrel=2
arch=('x86_64')
url="https://github.com/Nerimity/nerimity-desktop"
license=('custom:unknown')
depends=('fuse2' 'hicolor-icon-theme')
options=('!strip')
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.AppImage")
sha256sums=('d7687438236b7e2f0b237df114f5c1ca27a26754f079b76402a36fc58ff9e2e6')

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
		"squashfs-root/${_pkgname}.desktop"

	chmod -R a-x+rX squashfs-root/usr
}

package() {
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
