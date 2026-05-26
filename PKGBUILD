# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quadrant-bin
_pkgname=Quadrant
pkgver=26.6.0
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
sha256sums_aarch64=('458d6876985851ae9f54b9b3407466e8c94bbcb30c4fe061464e127394f4dcaf')
sha256sums_x86_64=('9e137e3778688df5e9b895bbc55b78c0be2d0be01113861e275c35d43dffbf37')
prepare() {
    sed -i "s/${pkgname%-bin}_next/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}_next" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
