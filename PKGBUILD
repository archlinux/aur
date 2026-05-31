# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quadrant-bin
_pkgname=Quadrant
pkgver=26.6.2
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
sha256sums_aarch64=('8c7b608064ed62a1a2a8283cf20b7208d813f6788be917ea9f37b9d58e8dacbd')
sha256sums_x86_64=('5bdb1dd00f9e8ddaa54eeac720207b9d747ecd2a2c2ee00254d6b7fb0a3a6a9d')
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
