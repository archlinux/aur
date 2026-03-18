# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=pocket-casts
pkgname="${_pkgname}-desktop-bin"
pkgver=0.12.0
_electronversion=40
pkgrel=1
pkgdesc="The Pocket Casts webapp, packaged for the Linux Desktop.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/felicianotech/pocket-casts-desktop-app"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/felicianotech/pocket-casts-desktop-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5478e5a98666c41de828fb7f50c3ea53b05755b7bda7d11211c6b1406d3046ba'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('c54f2313428ede218a7803710aedf5bf84e17b931e66c3b417b166d4925a414f')
sha256sums_x86_64=('543935a281250bb1608594ac9c782d0028239d61b582fe59778d124373b787c0')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/lib/${_pkgname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    sed -i -e "
        s/${_pkgname} %U/${pkgname%-bin} %U/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    find "${srcdir}/usr/lib/${_pkgname}/resources/app" -type f -name "*.snap" -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/usr/lib/${_pkgname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/usr/lib/${_pkgname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/usr/lib/${_pkgname}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
