# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pdmaner-bin
_appname=PDManer
pkgver=4.9.0
_electronversion=13
pkgrel=1
pkgdesc="A multi operating system open source and free desktop version relational database modeling tool.一款多操作系统开源免费的桌面版关系数据库模型建模工具"
arch=("x86_64")
url="http://www.pdmaner.com"
_downurl="https://github.com/zxp19821005/My_AUR_Files"
license=("MPL-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'dbus-glib'
    'libdbusmenu-glib'
    'gtk2'
    'java-runtime'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_downurl}/releases/download/v${pkgver}/${_appname}-linux_v${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://gitee.com/robergroup/pdmaner/raw/master/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('2e5817bd8d912fe81c62af357a73ea33947111aace5b191625d63de8a3e75fd3'
            '7c91afc2c15fc478de3fc38f2678e560906859da6932f2c03b6bc9076d592d18'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|Utility|Utility;Development|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}