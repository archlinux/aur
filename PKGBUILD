# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ten-hands-bin
_pkgname="Ten Hands"
pkgver=2.10.3
_electronversion=13
pkgrel=7
pkgdesc="Simplest way to organize and run tasks"
arch=('x86_64')
url='https://tenhands.app'
_ghurl="https://github.com/saisandeepvaddi/ten-hands"
depends=(
    'at-spi2-core'
    'libxcomposite'
    'libxrandr'
    'gtk3'
    'mesa'
    'cairo'
    'expat'
    'gdk-pixbuf2'
    'libxcb'
    'libx11'
    'libxext'
    'alsa-lib'
    'libxfixes'
    'nspr'
    'libxkbcommon'
    'libdrm'
    'libcups'
    'pango'
    'libxdamage'
    'nss'
)
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-app_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/saisandeepvaddi/ten-hands/v${pkgver}/LICENSE"
)
sha256sums=('5a1a4d3970a46d1fde2ccb506653f637a8b0edac5a77a64d12a45e723b555daa'
            '4844817e0496e77b4ff7dbf8084f475a9dbcb4ffe533b06960feac9fbe7cef2b')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}-app\" %U|${pkgname%-bin} --no-sandbox %U|g;s|=${pkgname%-bin}-app|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}-app.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}-app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/${pkgname%-bin}-app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}