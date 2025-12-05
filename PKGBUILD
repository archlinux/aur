# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=compress-o-bin
_pkgname=CompressO
pkgver=1.4.0
pkgrel=1
pkgdesc="A free and open-sourced cross-platform video compression app powered by FFmpeg.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/codeforreal1/compressO"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'ffmpeg'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('52fb92f494e0fdcb1d9c2798c5debced496a675b02eee81206edcdc8e63d3505')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Exec=app/Exec=${pkgname%-bin}/
        s/Icon=app/Icon=${pkgname%-bin}/
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/bin/${pkgname%-bin}_ffmpeg"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
