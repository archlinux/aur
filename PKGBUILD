# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="awakened-poe-trade-bin"
pkgver=3.21.10001
pkgrel=2
pkgdesc="Path of Exile trading app for price checking"
arch=('x86_64')
url="https://snosme.github.io/awakened-poe-trade/download"
_githuburl="https://github.com/SnosMe/awakened-poe-trade"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Awakened-PoE-Trade-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/SnosMe/awakened-poe-trade/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('6b7c710863e8014209ee4a514e0b972ccaf052f73ed39f6f65bb9e0fdd6cdc94'
            'ed4513f32c954f47ee4300042e7a199aabdda4ac3eab3cad49f05dab781f8730'
            'c70a2b05637e5699233ad66a2779a9d9a5ff925c846342687e804bf30da0971a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}