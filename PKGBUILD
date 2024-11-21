# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spie-bin
_pkgname=SPIE
pkgver=0.1.0
_electronversion=31
pkgrel=1
pkgdesc="A minimal serial monitor application using Electron, Node SerialPort and Ionic/Angular.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/robsonos/spie"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
    'libicns'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64-${pkgver}-install.tar.xz"
    "${pkgname%-bin}-${pkgver}.icns::https://raw.githubusercontent.com/robsonos/spie/v${pkgver}/apps/spie/resources/icons/icon.icns"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/robsonos/spie/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('51c6fe880e3646d0c858279c218229f86ffcf22cb2ed6d0d2947b019e8433595'
            '5dbb6967af509e69054c662c537915b0c4a025b3ed099c7684deed08eeb6985f'
            '2f5007c3cf090c9851c50bcfa349730ca9ed47f48b40b7fa5b48739599774ac3'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    icns2png -x "${srcdir}/${pkgname%-bin}-${pkgver}.icns" -o "${srcdir}"
    find "${srcdir}/${_pkgname}-"* \( -name "android-*" -o -name "darwin-*" -o -name "win32-*" -o -name "linux-arm*" \) \
        -type d -exec rm -rf {} +
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${_pkgname}-linux-x64-${pkgver}-install/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-linux-x64-${pkgver}-install/resources/app.asar.unpacked"  "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   _icon_sizes=(16x16 32x32 256x256 512x512 1024x1024)
   for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}