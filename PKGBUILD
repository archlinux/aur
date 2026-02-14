# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=smartsub-bin
_pkgname=SmartSub
_zhsname='妙幕'
pkgver=2.14.0
_electronversion=30
pkgrel=1
pkgdesc="A cross-platform client side tool that can generate subtitle files for video or audio in batches, and supports subtitle translation. It supports Baidu, Volcano, OpenAI, Olama, DeepSeek and other translators.(Prebuilt version,use system-wide electron)"
arch=('x86_64')
url="https://smartsub.lxd.one/"
_ghurl="https://github.com/buxuku/SmartSub"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python-openai-whisper'
    'ffmpeg'
)
makedepends=(
    'dpkg'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_Linux_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/buxuku/SmartSub/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('20feb712efb4561d174375a3bea9f963725ab8b098bf97553ae702548ddc80d2'
            '324178aaf0ebe3ab663803d3a63439cd8cdf02c3a4a40609c9ac6f8af517faed'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@ffmpeg-installer/linux-x64/ffmpeg"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    if find "${srcdir}/opt/${_pkgname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for subdir in "${srcdir}/opt/${_pkgname}/resources"/*; do
            if [ -d "${subdir}" ]; then
                cp -Pr --no-preserve=ownership "${subdir}"/* "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}