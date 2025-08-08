# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=logseq-desktop
pkgname="${_appname}-electron-bin"
_pkgname=Logseq
pkgver=0.10.13
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
sha256sums_aarch64=('4c28f56d5810706b6baa884d2667e51ad97855184feb2f637e02371eb86e1029')
sha256sums_x86_64=('7b9ccfee35a24cc67955439f4e482c3c28683a43e01a3b7730e41c3bbbdfe3cc')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/${_pkgname}-linux-"*/"${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
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