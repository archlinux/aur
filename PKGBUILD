# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spie-bin
_pkgname=SPIE
pkgver=0.2.0
_electronversion=31
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
sha256sums=('f5b968118746288a3cde072b15add5fc7c14c0a66f3b8b642fa7561bc57df5fa'
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
