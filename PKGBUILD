# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xmachoviewer-bin
pkgver=0.04
pkgrel=6
pkgdesc="Mach-O viewer for Windows, Linux and MacOS"
arch=(x86_64)
url="https://horsicq.github.io/#xmachoviewer"
_ghurl="https://github.com/horsicq/XMachOViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'qt5-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_Ubuntu_22.04_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/horsicq/XMachOViewer/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b39f9470d3b85e84b5123349a25e35ad414371c96d2980ac035780b6f69d2a8b'
            'd0dfc6996d90bc96474a32b5656eec06bf988cdbcfd226f24fcb7a062208e4ee'
            '06a41f24ffb21e368fcbaf77adf39ac1748ab44e8e8fc5cc54fa5063490dacab')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}