# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=node-flow
pkgname="${_pkgname//-/}-bin"
_appname=NodeFlow
pkgver=0.0.2_alpha
pkgrel=3
pkgdesc="An Editor for creating simple or complex OCR workflows"
arch=('x86_64')
url="https://github.com/maxnth/NodeFlow"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver//_/-}/${_appname}-${pkgver%_alpha}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/maxnth/NodeFlow/${pkgver//_/-}/License"
    "${pkgname%-bin}.sh")
sha256sums=('fd1bb578d47245a95ba7c206f7f64aa013e56afe2247511dea48e62190d4a545'
            '2fa2313855f0dfa9399163896c8a91747298ae501fb1f915e6a8479dc60f3791'
            '08f50af9bb7215a60d3af68d8395877c1570bf6f5d4e52f64469aa51ae7bab57')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    unlink "${srcdir}/app.asar.unpacked/node_modules/cpu-features/build/node_gyp_bins/python3"
    unlink "${srcdir}/app.asar.unpacked/node_modules/ssh2/lib/protocol/crypto/build/node_gyp_bins/python3"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g;s|Productivity|Utility|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}