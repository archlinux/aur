# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=winghexexplorer-bin
_pkgname=WingHexExplorer
_appname="com.wingsummer.${pkgname%-bin}"
pkgver=1.5.5
pkgrel=3
pkgdesc="基于 QT 编写的十六进制编辑器，采用 C++ 进行开发，目的是让 Deepin 上具有强大而免费的十六进制编辑器。"
arch=('x86_64')
url="https://github.com/Wing-summer/WingHexExplorer"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'qt5-x11extras'
    'libglvnd' 'glibc'
    'hicolor-icon-theme'
    'dtkgui'
    'dtkcore'
    'dtkwidget'
)
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('6d4d3ec3f90e91d3590758597c01eddc1eb1e1dba5e310bbd485f588ffbe9625')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/${_pkgname}/更新日志.log" "${srcdir}/opt/${_pkgname}/ChangeLog.log"
    mv "${srcdir}/opt/${_pkgname}/使用说明.txt" "${srcdir}/opt/${_pkgname}/ReadMe.txt"
    cp "${srcdir}/opt/${_pkgname}/images/icon.png" "${srcdir}/opt/${_pkgname}/images/winghexpro256.png"
    sed "s|\"/opt/${_pkgname}/${_pkgname}\"|${pkgname%-bin}|g;s|/opt/${_pkgname}/images/icon.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32 64 128 256; do
        install -Dm644 "${srcdir}/opt/${_pkgname}/images/winghexpro${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done   
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}