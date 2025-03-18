# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zhiximind-desktop-bin
_debname=com.zhixi.desktop
pkgver=3.3.6
_electronversion=22
pkgrel=1
pkgdesc="知犀思维导图官方版"
arch=('x86_64')
url="https://www.zhixi.com"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://www.zhixi.com/download/linux?channel=21C8B557"
    "LICENSE-${pkgver}.html::${url}/user-agreement"
    "${pkgname%-bin}.sh"
)
sha256sums=('035d3509f29ff68888277e84e1da4f326802f1c6feccd2449d7dce892e2b57f5'
            '0aa8fe4fb1f6bf313b3d6710a4aec6cebe7f4bb00d6ad5efb6f063cbefda2d82'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_debname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_debname}/resources/"*.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_debname}/resources/"{app.asar.unpacked,config.json} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}