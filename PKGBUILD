# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
pkgname=bananas-bin
_pkgname=Bananas
pkgver=0.0.22
_electronversion=31
pkgrel=2
pkgdesc="Simple peer-to-peer screen sharing tool without account or server requirements.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://getbananas.net/"
_ghurl="https://github.com/mistweaverco/bananas"
license=('MIT')
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/mistweaverco/bananas/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5ba8d10757c4ce9b880422e3746897d89b27647febd1f70ab5021f9ac10ade95'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('6bb740cdc0f44002dde14df6c9748f5ff3372ff85a2441eeed26948b99073631')
sha256sums_x86_64=('5deccf01a60d4c7e684a914690cf9b22c6e82ed32ede6415083ea2937aac5915')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/resources/icon.png" -t \
        "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/resources"
    _icon_sizes=(32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
