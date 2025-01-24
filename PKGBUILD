# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=compress-o-bin
_pkgname=CompressO
pkgver=1.2.0
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
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('b4ac23998a9acd97a25387610dfb8fd166883d6b4c2b3c31c638d66c1abb5dc4')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Comment=${_pkgname}/Comment=${pkgdesc}/g
        s/Development/AudioVideo/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/bin/${pkgname%-bin}_ffmpeg"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}