# Maintainer: Rain&Bus <rainandbus@gmail.com>
# Maintainer: Aron Young <tkf6fkt at gmail dot com>
_pkgname=obsidian
pkgname=obsidian-bin
pkgver=1.6.7
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
sha256sums_x86_64=('05fe48523335a17ea01a5c1713101db2f1053d830a5e428b9c115d9a1bd809c5')
sha256sums_aarch64=('427c562c9b050fd3f035b8308016249839a3e879b673e3dd29e985c688e1d6ec')

# https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/19
# https://sourceware.org/bugzilla/show_bug.cgi?id=31504
# TODO: remove this after these bug fixed
options=('!debug' '!strip')

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
