# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vidbee-bin
_pkgname=VidBee
pkgver=1.3.4
_electronversion=38
pkgrel=1
pkgdesc="Download videos from almost any website worldwide.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://vidbee.org/"
_ghurl="https://github.com/nexmoe/VidBee"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    'yt-dlp'
    'deno'
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/nexmoe/VidBee/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('e7ae77538bee1626c3520654a2cf14a07631005775a5111aad7d9fd5d479ecc1'
            '5cde322cd1fd10c409c8597eed127a08baa6c73b9430312de1aeb05f1dbb4953'
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
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_pkgname}/resources/resources/ffmpeg/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${srcdir}/opt/${_pkgname}/resources/resources/ffmpeg/ffprobe"
    ln -sf "/usr/bin/yt-dlp" "${srcdir}/opt/${_pkgname}/resources/resources/yt-dlp_linux"
    ln -sf "/usr/bin/deno" "${srcdir}/opt/${_pkgname}/resources/resources/deno"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}/opt/${_pkgname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/opt/${_pkgname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for subdir in "${srcdir}/opt/${_pkgname}/resources/"*; do
            if [ -d "${subdir}" ]; then
                cp -Pr --no-preserve=ownership "${subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}