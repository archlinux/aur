# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quadrant-bin
_pkgname=Quadrant
pkgver=26.7.4
pkgrel=1
pkgdesc="An easy way to manage your Minecraft modpacks, written in React and Rust.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://usequadrant.dev/"
_ghurl="https://github.com/QuadrantMC/quadrant"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libappindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}-stable/${_pkgname}-${pkgver}-stable-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}-stable/${_pkgname}-${pkgver}-stable-1.x86_64.rpm")
sha256sums_aarch64=('2c3b23af9fcc4a15c092808318384114bd4ca4946ab28ffd511caea4e93bd8ef')
sha256sums_x86_64=('b492ca0d16b9ffe592211003de127173ca3169403b46aef28ddb0a327347d677')
prepare() {
    sed -i "s/${pkgname%-bin}_next/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}_next" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
