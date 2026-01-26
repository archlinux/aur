# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
pkgname=vesktop-bin
_pkgname=Vesktop
_appname=vencord-desktop
pkgver=1.6.4
_electronversion=40
pkgrel=1
pkgdesc="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_appname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
    'debugedit'
)
optdepends=(
    'speech-dispatcher: High-level device independent layer for speech synthesis interface'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.x86_64.rpm")
source=("${pkgname%-bin}.sh")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('53ff5b99d5d814f4d58473c1ed7c2d714b0dfabac2bed2d07b827e1c86dbd0f3')
sha256sums_x86_64=('244ce3f54c6059c0c97cbfa81aa28759c13c054146cac3c8b3d1b7914f25b4dc')
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
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
