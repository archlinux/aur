# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=compressO
pkgname="${_appname//O/o}-bin"
_pkgname=CompressO
pkgver=2.1.0
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
sha256sums=('cbe0c442ed1c967d59c188a5cdf52c80556eb02ea4beea93e704af0bed228e0d')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Exec=${_appname}/Exec=${pkgname%-bin}/
        s/Icon=${_appname}/Icon=${pkgname%-bin}/
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/bin/${pkgname%-bin}_ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${pkgdir}/usr/bin/${pkgname%-bin}_ffprobe"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
