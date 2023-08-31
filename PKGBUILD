# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=awakened-poe-trade-bin
_pkgname=Awakened-PoE-Trade
pkgver=3.22.10003
pkgrel=1
pkgdesc="Path of Exile trading app for price checking"
arch=('x86_64')
url="https://snosme.github.io/awakened-poe-trade/download"
_githuburl="https://github.com/SnosMe/awakened-poe-trade"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/SnosMe/awakened-poe-trade/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('6fe7033a6534b3432a3f966009a7260289fc52a0de8c6e0770eaa2f947f67443'
            '5c8de7f881b34dc31f872531a1eee1eabc79e10acd8fc91c026e10c5a8258c3f'
            '91fd1545daaf446456e91253020f009ec24144278fd8bcf749b0cbf805c83d2f')
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