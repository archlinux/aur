# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spx-translation-bin
pkgver=2.0.5
_electronversion=25
pkgrel=6
pkgdesc="Aggregated Translation Program (Google + DeepL)(Prebuilt version.Use system-wide electron)聚合翻译程序(谷歌+deepl)"
arch=('x86_64')
url="https://github.com/mlmdflr/spx-translation"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/vv${pkgver}-1/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('49a8bfb21c7e3a55714f297120e5aacdbc81c5c22a00f1dafeb4610f380648de'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${pkgname%-bin}-linux\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}-linux/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}-linux/resources/extern" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}-linux/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}