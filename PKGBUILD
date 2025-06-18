# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: yjun <jerrysteve1101 at gmail dot com>
# Contributor: FlyInWind <2518509078@qq.com>
pkgname=ynote-desktop-bin
_zhsname='有道云笔记'
pkgver=8.1.41
_electronversion=18
_reldate='%2F2025%2F06%2F16%2F453421a8'
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
sha256sums=('b3595ff15ea8ae2cf88bd089803c1bc2225fd8cb9d0879630ee01daa90853b97'
            'a8aec47c7cc6e6d838d525c89b58a962d650c84b0ebec09ecfb8955381fe6460'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_zhsname}/${pkgname%-bin}" | grep -o 'Electron/[0-9.]+' | cut -d'/' -f2 | cut -d'.' -f1)"
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
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_zhsname}/resources/build" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644  "${srcdir}/opt/${_zhsname}/dll/scholar/client.so" -t "${pkgdir}/usr/lib/${pkgname%-bin}/dll/scholar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}