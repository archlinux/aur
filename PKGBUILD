# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=divicards-bin
_pkgname=Divicards
pkgver=0.11.0
pkgrel=1
pkgdesc="Desktop application for Path of Exile divination cards.(Prebuilt version)"
arch=('x86_64')
url="https://divicards-site.pages.dev/"
_ghurl="https://github.com/shonya3/divicards"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('873dc9e851c4aad0db2ad05b6b2182620f24c1ef4af7ef0f8a50e3baa67f2723')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        s/Exec=app/Exec=${pkgname%-bin}/g
        s/Icon=app/Icon=${pkgname%-bin}/g
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}