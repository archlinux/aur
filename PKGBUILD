# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youku-bin
_appname=YouKu
_chsname='优酷'
pkgver=1.0.0
_electronversion=9
pkgrel=9
pkgdesc="Linux version of the Youku client APP, implemented on UOS using Electron technology.(Prebuilt version.Use system-wide electron)Linux版优酷客户端APP,基于Electron技术实现在uos的APP客户端."
arch=('x86_64')
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
_uosurl="https://com-store-packages.uniontech.com/appstore/pool/appstore"
license=("LicenseRef-custom")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_uosurl}/u/uos-${_appname}-app/uos-${_appname}-app_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('ae0b2ecd57224db7eedcf453dcd1178b2bf78e08fea2885978f7048dd0ebb78f'
            '081c8844a98c3c379c23d5a8610b38e43ac152ca52621bff830379caaf1b6b27')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/uos-${pkgname%-bin}-app/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_chsname}\/${_appname}\"/${pkgname%-bin}/g
        s/\/opt\/${_chsname}\/resources\/assets\/images\/app_icon32.png/${pkgname%-bin}/g
        s/Categories=Viedo;/Categories=AudioVideo;/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_chsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_chsname}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_chsname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/${_chsname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}