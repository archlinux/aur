# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zhiximind-desktop-bin
pkgver=2.1.4.0
_electronversion=21
pkgrel=5
pkgdesc="知犀思维导图官方版"
arch=('x86_64')
url="https://www.zhixi.com"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/download/linux?channel=21C8B557"
    "LICENSE-${pkgver}.html::${url}/user-agreement"
    "${pkgname%-bin}.sh"
)
sha256sums=('972aed41c6a54acf99f0ccb60047f52ba9fe264fbee04a9a0c4746df7a33eb53'
            '2b4abfdc101c27d844600bf83d76be8a5b1ba3934db79166b5a85c82e73ca1c0'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|icon.ico|icon.png|g" -i "${srcdir}/app.asar.unpacked/dist/main/index.js"
    cp "${srcdir}/app.asar.unpacked/resources/icons.iconset/icon_32x32.png" "${srcdir}/app.asar.unpacked/resources/icon.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed -e "2,22d" -e "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed -e "3i Name[zh_CN]=知犀思维导图" -e "4i Comment[zh_CN]=知犀是一款全平台思维导图和思维图示软件，轻颜易用，可多人协作.理思路/记灵感/做规划/写笔记，多端云同步，节点无限制" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}