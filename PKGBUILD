# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zui-bin
_pkgname=Zui
pkgver=1.6.0
_electronversion=28
pkgrel=1
pkgdesc="A powerful desktop application for exploring and working with data. The official front-end to the Zed lake."
arch=('x86_64')
url="https://www.brimdata.io/"
_ghurl="https://github.com/brimdata/zui"
license=("BSD-3-Clause")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'sqlite'
    'python'
    'nss'
    'nspr'
    'libsecret'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/brimdata/zui/v${pkgver}/apps/zui/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('c857fae016a2f2c8e8d7af37e2f14cb1e1687e2db085ff5aa148561732b293dc'
            'e3d24db419fcb44a1dab91f351b8203e74e8501ea11c4be82ad3cc05070cad9f'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}