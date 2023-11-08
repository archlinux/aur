# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zhiximind-desktop-bin
pkgver=2.1.3.1
pkgrel=2
pkgdesc="知犀思维导图官方版"
arch=('x86_64')
url="https://www.zhixi.com"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron21'
    'hicolor-icon-theme'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://cdn-resource.zhixi.com/application/soft_package/channel/80004201/21C8B557/software/${pkgver}/jIgnVa/zhixilinux_21C8B557.deb"
    "LICENSE.html::${url}/user-agreement"
    "${pkgname%-bin}.sh"
)
sha256sums=('972aed41c6a54acf99f0ccb60047f52ba9fe264fbee04a9a0c4746df7a33eb53'
            '3e6d4f45483876e9b369f208e9d687bed28a8f433c996f49b23cd6ba463f47cc'
            'de23d03808c3a57469eb201cbdcd3f0b4c7382a3cb39012bea1470eb27d6ce1e')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|icon.ico|icon.png|g" -i "${srcdir}/app.asar.unpacked/dist/main/index.js"
    cp "${srcdir}/app.asar.unpacked/resources/icons.iconset/icon_32x32.png" "${srcdir}/app.asar.unpacked/resources/icon.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed -e "2,22d" -e "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -e "10 a\Name[zh_CN]=知犀思维导图" \
        -e "11 a\Comment[zh_CN]=知犀是一款全平台思维导图和思维图示软件，轻颜易用，可多人协作.理思路/记灵感/做规划/写笔记，多端云同步，节点无限制" \
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
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}