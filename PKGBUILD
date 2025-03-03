# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fontastic-bin
_pkgname=Fontastic
pkgver=0.2.0
_electronversion=25
pkgrel=5
pkgdesc="A stunning font management and cataloging application.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/tomshaw/fontastic"
license=('MIT')
conflits=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tomshaw/fontastic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b151f172ad321d94357a675843aa98f1b370e9bacb2ca2764125110281a595cc'
            'd461d5796257402081b89cae64365068a66d193696f7c64cb7e6fd307b4a48d9'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/resources/bin/activator" -t "${pkgdir}/usr/lib/${pkgname%-bin}/bin"
    _icon_sizes=(16x16 32x32 192x192 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"\
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}