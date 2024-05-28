# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: bgt <choo-yy at qq dot com>
# Contributor: glatavento <glatavento  at outlook dot com>
# Contributor: sukanka <su975853527 at gmail dot com>
_pkgname=siyuan
pkgname="${_pkgname}-note-bin"
pkgver=3.0.16
_electronversion=28
pkgrel=1
pkgdesc="A local-first personal knowledge management system.Use system-wide electron."
arch=('x86_64')
url="https://b3log.org/siyuan/"
_ghurl="https://github.com/siyuan-note/siyuan"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('6d4ed2bfa1cf274e24fa2812287f881ba4914dc4c9dd0ef475903079ade7113a'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|SiYuan-Electron|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|Utility|Office;Utility|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    sed "3i\Name[zh_CN]=思源笔记" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}