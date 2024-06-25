# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gensokyo-bin
_pkgname="Gensokyo Radio"
pkgver=1.0.0
_electronversion=31
pkgrel=1
pkgdesc="An app to listen to Gensokyo Radio with Discord RPC support."
arch=("x86_64")
url="https://github.com/Prince527GitHub/Gensokyo-Radio"
license=("AGPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/Debian.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('35aebac65eb66abd27555b65e8aac601724d6689f6555586c99653d6876679bd'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf "${srcdir}/data."*
    sed "/Comment/d" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "5i\Comment=${pkgdesc}" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}