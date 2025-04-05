# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dosbox
pkgname="${_pkgname}-staging-bin"
_appname="org.${pkgname%-bin}.${pkgname%-bin}"
pkgver=0.82.1
pkgrel=1
pkgdesc="A modern continuation of DOSBox with advanced features and current development practices.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL-2.0-or-later')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_pkgname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    'alsa-lib'
    'sdl2'
    'libglvnd'
    'sdl2_image'
    'sdl2_net'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('0b7ca2e0f1fbc10fe51c05011f6cad72d10608658de0a58e22a5a936d5e7d075'
            '5e664ddfd6f8016b079a4244fdc5746a253658554324f73dc5e406bf7d354456')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    sed -i "s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}-linux"*/desktop/"${_appname}".desktop
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}-linux"*/* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux"*/desktop/"${_appname}".desktop "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux"*/doc/manual.txt -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux"*/man/"${_pkgname}".1 -t "${pkgdir}/usr/share/man/man1"
    _icon_sizes=(16x16 22x22 24x24 32x32 48x48 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-bin}-linux"*/icons/hicolor/"${_icons}"/apps/"${_appname}".png \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}