# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=omniget-bin
_pkgname=OmniGet
pkgver=0.7.7
pkgrel=1
pkgdesc="Media downloader. Paste a link. Get your file. Udemy, Hotmart, Telegram and 1000+ Downloader.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://discord.gg/TA8A8r2z"
_ghurl="https://github.com/tonhowtf/omniget"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('037fdd468d0a77f7277f8e9ed93bd69d0a38b57a69a2d3ff685d60d8a982a728')
sha256sums_x86_64=('62d7e3cdc9e03add9d2d9df5727f1223eb44eecc16f7aa494cdf7ab53567e77c')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
