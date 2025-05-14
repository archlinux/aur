# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spie-bin
_pkgname=SPIE
pkgver=0.4.0
_electronversion=33
pkgrel=2
pkgdesc="A minimal serial monitor application using Electron, Node SerialPort and Ionic/Angular.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/robsonos/spie"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}-install.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/robsonos/spie/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('14361e10a8adf05aa3966ae3ffdf9c1b62e27245d2ea6a7ee2cc70ae6432fc6e'
            '2f5007c3cf090c9851c50bcfa349730ca9ed47f48b40b7fa5b48739599774ac3'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    find "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" -type d \( -name "android-*" -o -name "darwin-*" -o -name "win32-*" -o -name "linux-arm*" \) -exec rm -rf {} +
    sed -i -e "
        s/\"\/opt\/SPIE\/\${productName}\"/${pkgname%-bin}/g
        s/Icon=\${productName}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/\${productName}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked"  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/\${productName}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/\${productName}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}