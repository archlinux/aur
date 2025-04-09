# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sengi-bin
_pkgname=Sengi
pkgver=1.8.0
_electronversion=23
pkgrel=8
pkgdesc="Mastodon & Pleroma Multi-account Desktop Client.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/NicolasConstant/sengi"
_downurl="https://github.com/NicolasConstant/sengi-electron"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}${pkgver}.deb::${_downurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('0b6a43409861217dd11a76e34de174715adaaac1c3de3927d2f6bf08c5b81a4e'
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
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}