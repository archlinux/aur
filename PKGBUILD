# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>

_appname=proxy-pin
pkgname="${_appname//-/}-bin"
_pkgname=ProxyPin
pkgver=1.2.6
pkgrel=2
pkgdesc="Open source free packet capture tool.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/wanghongenpin/network_proxy_flutter"
license=('Apache-2.0')

conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")

depends=(
    'ca-certificates'
    'gtk3'
    'kde-cli-tools'   # ✅ 修复退出卡死
)

source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-Linux.deb"
    "${pkgname%-bin}.sh"
)

sha256sums=('d030cb5cd770270c0d4825ff5eaa41f4cf27d4244192f15aca3e4cd3c9889729'
            '5e33aee78e18f28f2fd0546933d8e435e66ef2777b39b0893c20e91e009e537f')

prepare() {
    # 启动脚本变量替换
    sed -i -e "
        s|@appname@|${pkgname%-bin}|g
        s|@runname@|${_pkgname}|g
    " "${srcdir}/${pkgname%-bin}.sh"

    # 解包 deb
    bsdtar -xf "${srcdir}/data."*

    # 🔥 修 desktop（关键）
    sed -i -e "
        s|/usr/lib/${_appname}|/usr/lib/${pkgname%-bin}|g
        s|Exec=.*|Exec=${pkgname%-bin}|g
        s|Icon=.*|Icon=${pkgname%-bin}|g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}

package() {
    # 启动脚本
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" \
        "${pkgdir}/usr/bin/${pkgname%-bin}"

    # 主程序
    install -Dm755 "${srcdir}/opt/${pkgname%-bin}/${_pkgname}" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/${_pkgname}"

    # 资源文件
    cp -r "${srcdir}/opt/${pkgname%-bin}/"{data,lib} \
        "${pkgdir}/usr/lib/${pkgname%-bin}/"

    # desktop
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

    # icon
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
