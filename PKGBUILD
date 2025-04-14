# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stremio-enhanced-bin
_pkgname='Stremio Enhanced'
pkgver=0.9.1
_electronversion=28
pkgrel=1
pkgdesc="An Electron-based Stremio client with plugins and themes support. It runs the Stremio Service automatically and loads the web version of Stremio.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/REVENGE977/stremio-enhanced-community"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'stremio-service'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/REVENGE977/stremio-enhanced-community/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}-${pkgver}.ico::https://raw.githubusercontent.com/REVENGE977/stremio-enhanced-community/v${pkgver}/images/icon.ico"
    "${pkgname%-bin}.sh"
)
sha256sums=('f9c7a853c7e550f1f98185af68b33caf7955c7b606a8955773b0577d9558da8a'
            'ed5f1a7791770773ed4aa8ba31fa28b3bb2cc1a263e0ed1997c290a6248a896a'
            'f549b47258defcef9c2864b740151c60f4510af184d346c38a6f8d081222b7a5'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    icotool -x "${srcdir}/${pkgname%-bin}-${pkgver}.ico" -o "${srcdir}"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}_"*_"${_icons}"x32.png \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
