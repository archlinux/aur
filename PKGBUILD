# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deltachat-desktop-bin
_pkgname=DeltaChat
pkgver=1.42.2
_electronversion=26
pkgrel=2
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://delta.chat/"
_ghurl="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
provides=(
    "${pkgname%-desktop-bin}=${pkgver}"
    "${pkgname%-bin}=${pkgver}"
)
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'python-yaml'
    'python>=3'
    'python-importlib-metadata'
    'python-setuptools'
    'python-wheel'
    'python-cffi'
    'python-requests'
    'python-pluggy'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::https://download.delta.chat/desktop/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "${pkgname%-bin}.sh"
)
sha256sums=('94f8b3ce275fd550bdc05b1443b3b1740d4e19c1f5feac284beb321e0b35a5b2'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}