# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=printnotes-bin
_pkgname=printnotes
pkgver=0.9.11
pkgrel=1
pkgdesc="A cross-platform markdown notes app inspired by Google Keep and Obsidian.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/RoBoT095/printnotes"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${CARCH}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('fcc2041dc7ea4cc72fa8dc7f28b583b18b0999fad47533d2f191ebe1177ca499'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/application-vnd.appimage/${pkgname%-bin}/g" "${srcdir}/squashfs-root/com.${pkgname%-bin}.${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/application-vnd.appimage.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/squashfs-root/com.${pkgname%-bin}.${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}