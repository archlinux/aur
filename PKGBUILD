# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vikunja-desktop-bin
_pkgname="Vikunja Desktop"
pkgver=0.22.0
_electronversion=25
pkgrel=4
pkgdesc="The open-source, self-hostable to-do app.Organize everything, on all platforms."
arch=('x86_64')
url="https://vikunja.io/"
_ghurl="https://github.com/go-vikunja/desktop"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::https://dl.vikunja.io/desktop/${pkgver}/Vikunja%20Desktop-${pkgver}.pacman"
    "${pkgname%-bin}.sh"
)
sha256sums=('23dfd62801f4d10295c0276787d58985569be125725068cb3e2d01e1efa78fe3'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g;s|Productivity|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}