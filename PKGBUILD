# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tome-bin
_pkgname=Tome
pkgver=0.11.1
_electronversion=22
pkgrel=2
pkgdesc="Git integrated cross-platform markdown editor.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://tome.evinowen.net/"
_ghurl="https://github.com/evinowen/tome"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}.Setup.${pkgver}.deb"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/evinowen/tome/${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('22b2b67e7b854c73ea6eff065dc0106c2d1113770b8bd5b039d8cfab6ba0f4ff'
            '3103a7058613516746435f89ff07509d42d9a07a485ad7b7fbc2781b06be4722'
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
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}