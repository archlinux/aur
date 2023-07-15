# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="melodie-bin"
pkgver=2.0.0
pkgrel=4
pkgdesc="Melodie is a portable, simple-as-pie music player"
arch=('x86_64')
url="https://feugy.github.io/melodie/"
_githuburl="https://github.com/feugy/melodie"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron18')
providers=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/feugy/melodie/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('3b841b77e3c974396e8317bcd14b7d023dfc7bd5dbc4c78f17eb53c143645dfe'
            '73c77debeee2edc386c515d1be6507325c36f4d5729e64743d7350ad146a3e2c'
            'd4cf6b67ef07b6c70919fc166865c126748863f6a9633d3750a9838de138b503')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/squashfs-root/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Audio|AudioVideo|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}