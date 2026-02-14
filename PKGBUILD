# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: yjun <jerrysteve1101 at gmail dot com>
# Contributor: FlyInWind <2518509078@qq.com>
pkgname=ynote-desktop-bin
_zhsname='有道云笔记'
pkgver=8.2.32
_electronversion=22
_reldate='%2F2026%2F02%2F03%2Fe59cc78c'
pkgrel=1
pkgdesc="Netease Youdao Ynote for Linux.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://note.youdao.com/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'perl'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://cowork-common-public-cdn.lx.netease.com/artifact${_reldate}.deb"
    "LICENSE.html::https://note.youdao.com/license.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('26d3a9b3a37373c6a000f3d46013e76965a7c1f11ef7b599a0660e9d2de4297d'
            'a8aec47c7cc6e6d838d525c89b58a962d650c84b0ebec09ecfb8955381fe6460'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_zhsname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\"\/opt\/${_zhsname}\/${pkgname%-bin}\" --no-sandbox/${pkgname%-bin}/g
        s/\/opt\/${_zhsname}\/resources\/build\/icon.svg/${pkgname%-bin}/g
        s/Utility/Office/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_zhsname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i -e "
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g
        s/\.\.\/dll\/scholar/dll\/scholar/g
    " "${srcdir}/app.asar.unpacked/dist/"{main.js,scholar.js}
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    rm -rf \
        "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/ffi-napi/prebuilds/"{darwin-x64,linux-arm64,win32-ia32,win32-x64} \
        "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/ref-napi/prebuilds/"{darwin-x64,linux-arm64,win32-ia32,win32-x64} \
        "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/node-screenshots-linux-x64-musl"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    if find "${srcdir}/opt/${_zhsname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for subdir in "${srcdir}/opt/${_zhsname}/resources/"*; do
            if [ -d "${subdir}" ]; then
                cp -Pr --no-preserve=ownership "${subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644  "${srcdir}/opt/${_zhsname}/dll/scholar/client.so" -t "${pkgdir}/usr/lib/${pkgname%-bin}/dll/scholar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
