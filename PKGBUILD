# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avaloniavisualbasic-bin
_pkgname='AvaloniaVisualBasic'
pkgver=0.0.1
pkgrel=2
pkgdesc="A recreation of the classic Visual Basic 6 IDE and language in C# with Avalonia.(Prebuilt version)"
arch=('x86_64')
url="https://bandysc.github.io/AvaloniaVisualBasic6/"
_ghurl="https://github.com/BAndysc/AvaloniaVisualBasic6"
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
makedepends=(
    'gendesk'
    'icoutils'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/vb6-linux-amd64.tar.gz"
    "${pkgname%-bin}.ico::https://raw.githubusercontent.com/BAndysc/AvaloniaVisualBasic6/v${pkgver}/AvaloniaVisualBasic.Desktop/vb6icon.ico"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/BAndysc/AvaloniaVisualBasic6/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('e3f42e0ebe08ad2fe947edcbf584d9fbd36fd1016cc9f6e3ed5f2ef0370c9725'
            '961be1877bc7d947855ece5d28fdb1cf7fce9801e12364eb16b2adad20f7a8b1'
            'c57b2ab528228e2728ac67e2625d0a975366e263ca799754b9f752324d399653'
            '9887c2b5cc4171f8768feae7da23aa6765eaa859434757d416fb8988a36936c8')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname//reM/ReM}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin}"
    icotool -x "${srcdir}/${pkgname%-bin}.ico" -o "${srcdir}"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${srcdir}/usr/lib/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    _icon_sizes=(16x16 32x32)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-bin}"*${_icons}*.png \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}