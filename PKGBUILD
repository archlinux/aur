# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=node-flow
pkgname="${_pkgname//-/}-bin"
_appname=NodeFlow
pkgver=0.0.2_alpha
_electronversion=23
pkgrel=10
pkgdesc="An Editor for creating simple or complex OCR workflows.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/maxnth/NodeFlow"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver//_/-}/${_appname}-${pkgver%_alpha}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/maxnth/NodeFlow/${pkgver//_/-}/License"
    "${pkgname%-bin}.sh"
)
sha256sums=('fd1bb578d47245a95ba7c206f7f64aa013e56afe2247511dea48e62190d4a545'
            '2fa2313855f0dfa9399163896c8a91747298ae501fb1f915e6a8479dc60f3791'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/${_pkgname}/${pkgname%-bin}/g
        s/Productivity/Utility/g
    " "${srcdir}/squashfs-root/${_pkgname}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}