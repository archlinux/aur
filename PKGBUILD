# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=media-hoarder-bin
_pkgname='Media Hoarder'
pkgver=1.4.5
_electronversion=13
pkgrel=1
pkgdesc="The media frontend for data hoarders and movie lovers.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/theMK2k/Media-Hoarder"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/theMK2k/Media-Hoarder/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('ffed84824bd25165a221b83a1360f92eb2aaa03f9418345c86bc65d74f1b703b'
            '3c67fce0428a3d133bb589cd1db329789ec235049af1412511f89420c99ae9a6'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
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
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "s/data\/${pkgname%-bin}.db_initial/..\/..\/${pkgname%-bin}\/data\/${pkgname%-bin}.db_initial/g" \
        "${srcdir}/app.asar.unpacked/js/app."*.js
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/data/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/data"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 180x180 192x192 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
