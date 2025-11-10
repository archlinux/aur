# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=aesir
pkgname="${_appname}-wallet-bin"
_pkgname=Aesir
pkgver=1.0.6
_electronversion=30
pkgrel=1
pkgdesc="The most current Kryptokrona GUI Wallet built with Svelte and Electron.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://kryptokrona.org/"
_ghurl="https://github.com/kryptokrona/aesir-wallet"
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kryptokrona/aesir-wallet/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ba2b2eae943f787d771223c29ecb13dbd1d5a493923f8ed87e645c15be9450f8'
            '6533f6c810ff2e8e6ca1c96333b082d2f4e755f4ee586d2ef320c34782503950'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -e "
        s/\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    find "${srcdir}/opt/${_pkgname}/resources/" -type d \( -name "linux-arm*" -o -name "android-arm*" -o -name "linux-ia32" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
