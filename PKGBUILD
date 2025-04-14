# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-docs-bin
_pkgname="Google Docs"
pkgver=2022.12.1
_electronversion=25
pkgrel=14
pkgdesc="Google Docs Desktop App made with electron.Includes Google Docs, Sheets, Slides, Forms, and Drive.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Comp-Labs/Google-Docs"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname// /-}-linux-amd64-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Comp-Labs/Google-Docs/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ec35d80b9189ddfa095b108fc939490e0d2ef682036a82e7807679ae0b3a49d4'
            '22d8c1bb0c91f6cb8fa332a53a40d5223f7caa4b12af0029f4b0c2b65b6a1596'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${_pkgname// /-}\"/${pkgname%-bin}/g
        s/${_pkgname// /-}/${pkgname%-bin}/g
        s/Category;/Utility;Office;/g
    " "${srcdir}/usr/share/applications/${_pkgname// /-}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname// /-}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname// /-}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}