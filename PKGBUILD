# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=newpad-bin
_pkgname=NewPad
pkgver=1.3.0
_electronversion=22
pkgrel=6
pkgdesc="An OblivionOcean Software, Bro.(Prebuilt version.Use system-wide electron)高颜值、易上手的Markdown记事本"
arch=('x86_64')
url="https://github.com/OblivionOcean/NewPad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'gendesk'
    'icoutils'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/OblivionOcean/NewPad/${pkgver}/License"
    "${pkgname%-bin}.sh"
)
sha256sums=('cf2934d09001055e05fbf6bcdfdfd355ef6c5ca96f8419da0a2b18f1368f152a'
            '5950cbd8232f1a8804591dd285cf0c27a9b5078c2d2d51030972b334664889d4'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    asar e "${srcdir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    icotool -x "${srcdir}/app.asar.unpacked/logo.ico" -o "${srcdir}/app.asar.unpacked/logo.png"
    sed -i "s/logo.ico/logo.png/g" "${srcdir}/app.asar.unpacked/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/app.asar.unpacked/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}