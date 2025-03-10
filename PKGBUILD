# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=remarkable-remember
pkgname="${_appname}-bin"
_pkgname='reMarkableRemember'
_debname="dev.schneider.${_appname//-/}"
pkgver=1.7.3
pkgrel=1
pkgdesc="A cross-platform management application for your reMarkable tablet.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/ds160/remarkable-remember"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'fontconfig'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ds160/remarkable-remember/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ce46b168873c89cd7f1cedacb8791829c17cfd7fcf9ea837d4cacb08ad96ea73'
            '9887c2b5cc4171f8768feae7da23aa6765eaa859434757d416fb8988a36936c8')
sha256sums_aarch64=('523590187acd6a30f0f0303885c3b58aef5079409d6f09f1ae98b81440d98c8e')
sha256sums_x86_64=('b21defb23d21003cd77c6b6a0881e83fd8d198e44fd5b91cedab030eda44dd32')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname//reM/ReM}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_debname}\/${_pkgname//reM/ReM}/${pkgname%-bin}/g
        s/Icon=${_debname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_debname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_debname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}