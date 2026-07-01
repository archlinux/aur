# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youwee-bin
_pkgname=Youwee
pkgver=0.19.0
pkgrel=1
pkgdesc="A beautifull YouTube, TikTok, Instagram and 1800+ sites downloader (yt-dlp GUI) and AI summary video content for cross-platform."
arch=('x86_64')
url="https://github.com/vanloctech/youwee"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'yt-dlp'
    'ffmpeg'
    'bun'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-Linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/vanloctech/youwee/v${pkgver}/LICENSE"
)
sha256sums=('f8053da6fcb3340c16354ac6b32de17a7369def44fe622f16691232f8c17dfa0'
            '1cea78a161f726406b7611610171f5ac0e42b620126334e1150084179faf5b7b')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=AudioVideo;Utility/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
