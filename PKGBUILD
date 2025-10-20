# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=logseq-desktop
pkgname="${_appname}-electron-bin"
_pkgname=Logseq
pkgver=0.10.14
_electronversion=34
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://logseq.com/"
_ghurl="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${_appname}"
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
    'perl'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
    '!strip'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-arm64-${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('0986b9cad64ba81544a3de7f9cd03fb3baabf078e2b12cf0fcd4ea48d4b13485')
sha256sums_x86_64=('11b3837d3549e43db24a4211e5b589559f554e4a10d59f03e13a26f30e1b8db6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/${_pkgname}-linux-"*/"${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-linux-"*/resources/app  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-"*/resources/app/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
