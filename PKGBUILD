# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=icloud-wrapper-bin
_pkgname=iCloud
pkgver=1.0.2
_electronversion=25
pkgrel=1
pkgdesc="Electron wrapper for Apple iCloud (https://www.icloud.com).(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/chillcarne/icloud-wrapper"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/chillcarne/icloud-wrapper/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0a1f6d8a841960fa9ec8fe064bd48308ab449c021f261a38b1fa62d52cefca7b'
            'bd511ceb3c4280a307fe633f8279568b8703aef377badb36ddf999b37b241ecf'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}