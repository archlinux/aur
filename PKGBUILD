# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=k_and_b-bin
_pkgname="K\&B Music"
pkgver=1.5.0
pkgrel=1
pkgdesc="Search and play music videos from Bilibili, manage playlists and favorites, enjoy synced rolling lyrics, and all the music player features.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/AgainsTurb/K-and-B-Music"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('1fb8dbe83b3e4c7de18aad5389018ca80c1e9570b8fe3493d35a8c004b81685c')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=AudioVideo;/g
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
