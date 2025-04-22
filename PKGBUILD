# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zui-bin
_pkgname=Zui
pkgver=1.18.0
_electronversion=30
pkgrel=3
pkgdesc="A powerful desktop application for exploring and working with data.The official front-end to the Zed lake.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.brimdata.io/"
_ghurl="https://github.com/brimdata/zui"
license=("BSD-3-Clause")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'sqlite'
    'python'
    'nss'
    'nspr'
    'libsecret'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/brimdata/zui/v${pkgver}/apps/zui/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('8213e8040d1f932c1e9155640ebde67a09f47c3102d6b2fc0d5f1c08d7341e8d'
            'e3d24db419fcb44a1dab91f351b8203e74e8501ea11c4be82ad3cc05070cad9f'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}