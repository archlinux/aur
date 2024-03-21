# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zhiximind-desktop-bin
pkgver=2.1.3.1
_electronversion=19
pkgrel=7
pkgdesc="知犀思维导图官方版"
arch=('x86_64')
url="https://www.zhixi.com"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/download/linux?channel=21C8B557"
    "LICENSE-${pkgver}.html::${url}/user-agreement"
    "${pkgname%-bin}.sh"
)
sha256sums=('972aed41c6a54acf99f0ccb60047f52ba9fe264fbee04a9a0c4746df7a33eb53'
            '600440cab710a1667b3c10eec7c307186cd36cc46eef17e27fcecde37d4c5267'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "2,22d" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed -e "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "4i\Name[zh_CN]=知犀思维导图" \
        -e "4i\Comment[zh_CN]=知犀是一款全平台思维导图和思维图示软件，轻颜易用，可多人协作.理思路/记灵感/做规划/写笔记，多端云同步，节点无限制" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}