# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>

_appname=proxy-pin
pkgname=proxypin-bin-fixed
_pkgname=ProxyPin
pkgver=1.2.6
pkgrel=1
pkgdesc="ProxyPin binary with KDE6 compatibility fixes and runtime fixes (unofficial)"
arch=('x86_64')
url="https://github.com/wanghongenpin/network_proxy_flutter"
license=('Apache-2.0')

conflicts=('proxypin-bin' 'proxypin-bin-debug')
provides=("proxypin-bin=${pkgver}")

options=(!debug)

depends=(
    'ca-certificates'
    'gtk3'
    'kde-cli-tools'
    'zenity'
)

source=(
    "proxypin-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-Linux.deb"
    "proxypin.sh"
)

sha256sums=('d030cb5cd770270c0d4825ff5eaa41f4cf27d4244192f15aca3e4cd3c9889729'
            'fced32536801d7664c542f9f37bc8978a12c3d4342ee424ff23353c4e9a1251d')

prepare() {
    # 🔥 修启动脚本
    sed -i -e "
        s|@appname@|proxypin-bin-fixed|g
        s|@runname@|${_pkgname}|g
    " "${srcdir}/proxypin.sh"

    # 解包 deb
    bsdtar -xf "${srcdir}/data."*

    # 🔥 修 desktop
    sed -i -e "
        s|/usr/lib/${_appname}|/usr/lib/proxypin-bin-fixed|g
        s|Exec=.*|Exec=proxypin-bin-fixed|g
        s|Icon=.*|Icon=proxypin-bin-fixed|g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}

package() {
    # 启动脚本
    install -Dm755 "${srcdir}/proxypin.sh" \
        "${pkgdir}/usr/bin/proxypin-bin-fixed"

    # 主程序
    install -Dm755 "${srcdir}/opt/proxypin/${_pkgname}" \
        "${pkgdir}/usr/lib/proxypin-bin-fixed/${_pkgname}"

    # 资源文件
    cp -r "${srcdir}/opt/proxypin/"{data,lib} \
        "${pkgdir}/usr/lib/proxypin-bin-fixed/"

    # desktop
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" \
        "${pkgdir}/usr/share/applications/proxypin-bin-fixed.desktop"

    # icon（系统用）
    install -Dm644 "${srcdir}/opt/proxypin/data/flutter_assets/assets/icon.png" \
        "${pkgdir}/usr/share/pixmaps/proxypin-bin-fixed.png"

    # 🔥 关键：兼容 upstream 写死 /opt/proxypin
    install -d "${pkgdir}/opt"
    ln -s /usr/lib/proxypin-bin-fixed "${pkgdir}/opt/proxypin"
}
