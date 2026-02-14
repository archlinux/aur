# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stoat-desktop-bin
_pkgname=Stoat
pkgver=1.2.0
_electronversion=38
pkgrel=2
pkgdesc="Stoat for Desktop.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://stoat.chat/"
_ghurl="https://github.com/stoatchat/for-desktop"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-assets::git+https://github.com/stoatchat/assets"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip")
sha256sums=('SKIP'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('8619fee1ec83a6969887814349139acedd5a8359410c4330a7eb40473711cb73')
sha256sums_x86_64=('067a2dcf73c3d1669f329e46c30716573028b38822ed31c0e487eed8a020fb5f')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/${_pkgname}-"*/"${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    if find "${srcdir}/${_pkgname}-"* -mindepth 1 -maxdepth 1 -type d | read; then
        for subdir in "${srcdir}/opt/${_pkgname}/${_pkgname}-"*/*; do
            if [ -d "${subdir}" ]; then
                cp -Pr --no-preserve=ownership "${subdir}"/* "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname%-bin}-assets/desktop/icon@3x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}