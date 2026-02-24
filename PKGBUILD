# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vidbee-bin
_pkgname=VidBee
pkgver=1.3.0
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
sha256sums=('4ca055f6993a8495da5bbfb8e453ad3747e6f4fbd15752a7f5f53de29c2839cd'
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
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/app.asar.unpacked/resources/ffmpeg/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${srcdir}/app.asar.unpacked/resources/ffmpeg/ffprobe"
    ln -sf "/usr/bin/yt-dlp" "${srcdir}/app.asar.unpacked/resources/yt-dlp_linux"
    ln -sf "/usr/bin/deno" "${srcdir}/app.asar.unpacked/resources/deno"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/ffmpeg/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/ffmpeg/ffprobe"
    ln -sf "/usr/bin/yt-dlp" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/yt-dlp_linux"
    ln -sf "/usr/bin/deno" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/deno"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
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
