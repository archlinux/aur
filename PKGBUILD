# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youku-bin
_appname=YouKu
_chsname="优酷"
pkgver=1.0.0
_electronversion=9
pkgrel=3
pkgdesc="Linux版优酷客户端APP,基于Electron技术实现在uos的APP客户端."
arch=('x86_64')
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
_uosurl="https://com-store-packages.uniontech.com/appstore/pool/appstore"
license=("custom")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_uosurl}/u/uos-${_appname}-app/uos-${_appname}-app_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('ae0b2ecd57224db7eedcf453dcd1178b2bf78e08fea2885978f7048dd0ebb78f'
            '0ef69fc4475f0df291462d305719da29177936c3e45a219fad4ffb92ad7e595f')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|\"/opt/${_chsname}/${_appname}\"|${pkgname%-bin}|g" \
        -e "s|/opt/${_chsname}/resources/assets/images/app_icon32.png|${pkgname%-bin}|g" \
        -e "s|Categories=Viedo;|Categories=AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_chsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_chsname}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_chsname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/${_chsname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}