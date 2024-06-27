# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altair-bin
_pkgname="Altair GraphQL Client"
pkgver=7.2.1
_electronversion=26
pkgrel=1
pkgdesc="A beautiful feature-rich GraphQL Client for all platforms."
arch=('x86_64')
url="https://altairgraphql.dev/"
_ghurl="https://github.com/altair-graphql/altair"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64_linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/altair-graphql/altair/v${pkgver}/packages/altair-core/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('56a0cc76bbe7f620f7fac3832d4eb14e79092744e03fb6916ab3a7f19a8b5208'
            'a406579cd136771c705c521db86ca7d60a6f3de7c9b5460e6193a2df27861bde'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 96x96 120x120 144x144 192x192 310x310;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}