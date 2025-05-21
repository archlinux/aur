# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wj-markdown-editor-bin
pkgver=2.4.0
_electronversion=35
pkgrel=1
pkgdesc="An open-source desktop markup editor that supports webdav.(Prebuilt version.Use system-wide electron)一款支持webdav的开源桌面端markdown编辑器"
arch=('x86_64')
url="https://github.com/nlbwqmz/wj-markdown-editor"
license=('MIT')
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-git"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-${CARCH}-${pkgver}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/nlbwqmz/wj-markdown-editor/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('7ae94ef75c3ad413fc8c7b2dba3d4c2d4dd91c212e8d2ea47477830c1198235b'
            '4db85f2bcfa2b60623a893393a61158a562fd907cf1244a06f41fd11eb6f8605'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
