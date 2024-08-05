# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: yjun <jerrysteve1101 at gmail dot com>
# Contributor: FlyInWind <2518509078@qq.com>
pkgname=ynote-desktop-bin
_zhsname="有道云笔记"
pkgver=8.0.10
_electronversion=18
pkgrel=1
pkgdesc="Netease Youdao Ynote for Linux.Use system-wide electron."
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
    "${pkgname%-bin}-${pkgver}.deb::https://cowork-common-public-cdn.lx.netease.com/artifact%2F2024%2F07%2F16%2F3144a669.deb"
    "LICENSE.html::https://note.youdao.com/license.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('e0a09c0b831ab3a2086ff87321ff2990901c4a1b5dc2ace9c4b2f343e58db1ba'
            'a8aec47c7cc6e6d838d525c89b58a962d650c84b0ebec09ecfb8955381fe6460'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"\/opt\/${_zhsname}\/${pkgname%-bin}\" --no-sandbox|${pkgname%-bin}|g" \
        -e "s|\/opt\/${_zhsname}\/resources\/build\/icon.svg|${pkgname%-bin}|g" \
        -e "s|Utility|Utility;Office|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_zhsname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g;s|\.\.\/dll\/scholar|dll\/scholar|g" \
      -i "${srcdir}/app.asar.unpacked/dist/"{main.js,scholar.js}
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_zhsname}/resources/"{app.asar.unpacked,build} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644  "${srcdir}/opt/${_zhsname}/dll/scholar/client.so" -t "${pkgdir}/usr/lib/${pkgname%-bin}/dll/scholar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}