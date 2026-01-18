# Maintainer: JamDon2 <hello at jamdon2 dot dev>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
# Based on vesktop-bin from the AUR
pkgname=vesktop-wayafknext-bin
_pkgname=Vesktop
_appname=vencord-desktop
pkgver=1.6.3
_electronversion=39
pkgrel=2
pkgdesc="Vesktop with WayAFKNext plugin for Wayland idle detection (Hyprland, Sway, etc)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')
provides=(
    "vesktop=${pkgver}"
    "${_appname}=${pkgver}"
)
conflicts=(
    'vesktop'
    'vesktop-bin'
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
    'debugedit'
)
makedepends=(
    'asar'
)
optdepends=(
    'speech-dispatcher: High-level device independent layer for speech synthesis interface'
)
source_aarch64=("vesktop-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/vesktop-${pkgver}.aarch64.rpm")
source_x86_64=("vesktop-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/vesktop-${pkgver}.x86_64.rpm")
source=('vesktop.sh')
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('a4535e1d2d6c56f353e1bd06690c33b40284fba5970269e4a7ac1171a15862ff')
sha256sums_x86_64=('0ad58d3c62b1bcb83ac7676998b2c6c38dc30522eae3e53d3cae230082d14f4e')

_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/vesktop" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}

prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/vesktop/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/vesktop/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/vesktop.sh"

    _get_electron_version

    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/vesktop.desktop"

    # Patch app.asar to use custom Vencord build
    asar extract "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app"
    sed -i 's|Vendicated/Vencord|jamdon2/vencord-wayafknext|g' \
        "${srcdir}/app/dist/js/main.js" \
        "${srcdir}/app/dist/js/main.js.map"
    asar pack "${srcdir}/app" "${srcdir}/opt/${_pkgname}/resources/app.asar"
}

package() {
    install -Dm755 "${srcdir}/vesktop.sh" "${pkgdir}/usr/bin/vesktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/vesktop"
    install -Dm644 "${srcdir}/usr/share/applications/vesktop.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/vesktop.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
