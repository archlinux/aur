# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moekoemusic-bin
_pkgname='MoeKoe Music'
_zhsname='萌音'
pkgver=1.6.0
_electronversion=39
pkgrel=1
pkgdesc="An open-source, concise, and aesthetically pleasing third-party client for KuGou.(Prebuilt version.Use system-wide electron)一款开源简洁高颜值的酷狗第三方客户端"
arch=('x86_64')
url="https://moejue.cn/"
_ghurl="https://github.com/iAJue/MoeKoeMusic"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}_v${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/iAJue/MoeKoeMusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('4fbd8fd61896c4a990f66abe289b9efdb15e0378b076b975cfc23d4fd9928f04'
            'f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505'
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
    sed -i -e "
        s/\/opt\/${_pkgname}\///g
        s/Utility/AudioVideo/g
        3i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar"
    sed -i -e "
        s/icon\.ico/icon\.png/g
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g
        s/\.\.\/api/\.\/api/g
    " "${srcdir}/app.asar.unpacked/electron/appServices.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}/opt/${_pkgname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/opt/${_pkgname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/opt/${_pkgname}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"{api,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
