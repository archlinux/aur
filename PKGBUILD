# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youwee-bin
_pkgname=Youwee
pkgver=0.20.0
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
sha256sums=('8b1e8197bc1b0307759558d3fbcaddf57dcb0fde7433cb33d9ba7d0299602efb'
            'be375f988f20aae5edbc8a986413f2fb132f45cf6bf2615e4446294094f4828c')
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
