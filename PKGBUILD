# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peersky-browser-bin
_pkgname='Peersky Browser'
pkgver=1.0.0_beta.10
_electronversion=29
pkgrel=1
pkgdesc="A minimal local-first p2p web browser: access, communicate, and publish offline.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://peersky.p2plabs.xyz/"
_ghurl="https://github.com/p2plabsxyz/peersky-browser"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}-linux-x64.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/p2plabsxyz/peersky-browser/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('457f92423c59110d37838c4a8d3a8450f89408c98591b8e95af6136c7b35c1a0'
            '4a67a49c9cb2c0a80dcb67bb35bb7c10691b1460200398866df24cd0b8e00cab'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
