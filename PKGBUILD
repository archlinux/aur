# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youku-bin
_appname=YouKu
_chsname="优酷"
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux版优酷客户端APP,基于Electron技术实现在uos的APP客户端."
arch=('x86_64')
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
_uosurl="https://com-store-packages.uniontech.com/appstore/pool/appstore"
license=("custom")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron9' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_uosurl}/u/uos-${_appname}-app/uos-${_appname}-app_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('ae0b2ecd57224db7eedcf453dcd1178b2bf78e08fea2885978f7048dd0ebb78f'
            '0989cadf3c3e34f8271af68716adfa43438b1b47b154f0a52490e30a944c31a0')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|\"/opt/${_chsname}/${_appname}\" %U|${pkgname%-bin}|g" \
        -e "s|/opt/${_chsname}/resources/assets/images/app_icon32.png|${pkgname%-bin}|g" \
        -e "s|Categories=Viedo;|Categories=AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_chsname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_chsname}/resources/assets" "${pkgdir}/opt/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/${_chsname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
