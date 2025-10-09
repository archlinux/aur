# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hayase-bin
_pkgname=Hayase
pkgver=6.4.33
_electronversion=38
pkgrel=1
pkgdesc="Formerly Miru. Torrent streaming made simple. Watch anime torrents, real-time with no waiting for downloads.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://hayase.watch/"
_ghurl="https://github.com/hayase-app/ui"
license=('BUSL-1.1')
conflicts=("${pkgname%-bin}")
provides=(
    "${pkgname%-bin}=${pkgver}"
    'miru'
)
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/linux-${pkgname%-bin}-${pkgver}-linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/hayase-app/ui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('8de18dc281da6ac2181e8bcda357ab099ed5c5ebb56d0287244079faf2df6f2d'
            '2ce1355094b25dd0c0d777b33d610dbe669e2e3a13659637d41e9a096ab65e9b'
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
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/utp-native/prebuilds/"{darwin-*,win32-*}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
