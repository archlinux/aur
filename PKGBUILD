# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=youku
pkgname="${_pkgname}-uos-electron-bin"
_chsname="优酷"
_appname=YouKu
pkgver=1.0.0
pkgrel=3
pkgdesc="uos版本优酷客户端APP,基于Electron 技术实现在uos的APP客户端."
arch=('x86_64')
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
_uosurl="https://com-store-packages.uniontech.com/appstore/pool/appstore"
license=("unknown")
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
depends=('bash' 'electron9' 'hicolor-icon-theme')
source=("${_appname}-${pkgver}.deb::${_uosurl}/u/uos-${_appname}-app/uos-${_appname}-app_${pkgver}_amd64.deb"
    "${_pkgname}.sh")
sha256sums=('ae0b2ecd57224db7eedcf453dcd1178b2bf78e08fea2885978f7048dd0ebb78f'
            '69787ae3977f72b73329e5cf5d2960732afc3274675a7475e923708a8216e193')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_chsname}/${_appname}\" %U|${_pkgname}|g;s|/opt/${_chsname}/resources/assets/images/app_icon32.png|${_pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/opt/${_chsname}/resources/app.asar" -t "${pkgdir}/opt/${_pkgname}/resources"
    cp -r "${srcdir}/opt/${_chsname}/resources/assets" "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${srcdir}/opt/${_chsname}/swiftshader/"*.so -t "${pkgdir}/opt/${_pkgname}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
}