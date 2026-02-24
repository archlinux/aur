# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stremio-web-desktop-bin
_pkgname='Stremio Web Desktop'
pkgver=464
_subver=1.0.0
_electronversion=33
pkgrel=1
pkgdesc="Stremio Web as Electron Desktop App. Latest Stremio Web v5 and Server bundled as electron app.Not affiliated with Stremio in any way.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Zaarrg/stremio-web-desktop"
license=(
    'GPL-3.0-only'
    'MIT'
)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${_subver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('2cc66a1a3040cdcd4461f7e6c28fd194577bb7f1df2944e81c685a5d3379e3a2'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    find "${srcdir}/usr/lib/${pkgname%-bin}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/usr/lib/${pkgname%-bin}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/usr/lib/${pkgname%-bin}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}