# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pdmaner-bin
_appname=PDManer
pkgver=4.6.3
pkgrel=1
pkgdesc="A multi operating system open source and free desktop version relational database modeling tool.一款多操作系统开源免费的桌面版关系数据库模型建模工具"
arch=("x86_64")
url="http://www.pdmaner.com"
_downurl="https://github.com/zxp19821005/My_AUR_Files"
license=("MPL2")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_downurl}/releases/download/v${pkgver}/${_appname}-linux_v${pkgver}.AppImage"
    "LICENSE::https://gitee.com/robergroup/pdmaner/raw/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('19337a28b8071b32594ee7da87298fa058be409d1031b9f07326c586ff93155c'
            '05eec509c11d99970dc4ca5bed4aae992960fd7f168e1746089c49643a18f461'
            '8c1047b646140d1b3843c809eeb303aac968064a00c5f5408d027d3fcec0350d')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Utility|Utility;Development|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}