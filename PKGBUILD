# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=facebook
pkgname="native-${_appname}-bin"
_pkgname=Facebook
pkgver=1.2.0
_electronversion=34
pkgrel=1
pkgdesc="A native Facebook client for desktop, which is an Electron app that wraps the Facebook website with some touches.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://yuhapps.dev/"
_ghurl="https://github.com/YuhApps/NativeFacebook"
license=('ISC')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-1.1.20-linux-x64.tar.xz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/YuhApps/NativeFacebook/v${pkgver}/src/assets/${_appname}.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('754d15253aa1aeaa10036008779e80f5861239c3f196aaa343f73278bab6cdc1'
            '69ec892b44cd81f4547b1981c7696789cbdb05fc7f66975ce03409f9c717eec1'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}