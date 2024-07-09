# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=polar-bin
_pkgname=Polar
pkgver=2.2.0
_electronversion=13
pkgrel=3
pkgdesc="One-click Bitcoin Lightning networks for local app development & testing.Use system-wide electron."
arch=("x86_64")
url="https://lightningpolar.com/"
_ghurl="https://github.com/jamaljsr/polar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    #'docker'
    #'docker-compose'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-V${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jamaljsr/polar/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('d7065df8c171fc6b6231dc928bc3dbff62c243417e402fd2d4645a4b453868db'
            '971e947b52af09847d493b326953f2cbc91669441eab0d5e74eac38b8e162904'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}