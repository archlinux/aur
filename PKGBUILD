# Maintainer: Rain&Bus <rainandbus@gmail.com>
# Maintainer: Aron Young <tkf6fkt at gmail dot com>
_pkgname=obsidian
pkgname=obsidian-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files"
arch=('x86_64' 'aarch64')
url="https://github.com/obsidianmd/obsidian-releases"
license=('custom:Commercial')
depends=('fuse2')
conflicts=('obsidian')
options+=('!strip')
source_x86_64=(${pkgname}-${pkgver}-x86_64.AppImage::"${url}/releases/download/v${pkgver}/Obsidian-${pkgver}.AppImage")
source_aarch64=(${pkgname}-${pkgver}-aarch64.AppImage::"${url}/releases/download/v${pkgver}/Obsidian-${pkgver}-arm64.AppImage")
sha256sums_x86_64=('078b33ddc652766dfdd71e6f1a333ad2e5b1bac15bd8454655e46ff9a0e2b021')
sha256sums_aarch64=('89cbe08b2738222687728b83aeaf3378b6b04651c0bc18f0715029e31e79b350')

prepare() {
    _appimage="${pkgname}-${pkgver}-${CARCH}.AppImage"
    cd ${srcdir}
    chmod +x ${_appimage}
	./${_appimage} --appimage-extract ${_pkgname}.desktop
	./${_appimage} --appimage-extract usr/share/icons/hicolor/128x128/apps/${_pkgname}.png
	chmod -R a-x+rX squashfs-root/usr
}

package() {
    _appimage="${pkgname}-${pkgver}-${CARCH}.AppImage"
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

	sed -i "s|Exec=AppRun --no-sandbox %U|Exec=/usr/bin/${_pkgname} --no-sandbox %U|" "${srcdir}/squashfs-root/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
