# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pomodoro-bin
pkgver=1.9.6
_electronversion=25
pkgrel=4
pkgdesc="Pomodoro timer base on Electron."
arch=("x86_64")
url="https://github.com/AndrewMaksimchuk/pomodoro"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python>3'
    'python-setuptools'
    'nodejs'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_1.8.2_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/AndrewMaksimchuk/pomodoro/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a6ef5c724b0f419e36455bf8b27978603222fd5bb3a17f449459037d44fd05cb'
            '6c3be11c505c08a5a1a041f62fff718177de780c85e4e49609aa5ca22c2148a9'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}