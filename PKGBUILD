# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rclone-ui-bin
_pkgname='Rclone UI'
pkgver=3.7.2
pkgrel=1
pkgdesc="The cross-platform desktop GUI for rclone & S3.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://rcloneui.com/"
_ghurl="https://github.com/rclone-ui/rclone-ui"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'rclone'
    'libayatana-appindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}_x86_64.rpm")
sha256sums_aarch64=('d50ffe7a5a0ab66dd361d18b967f854b54541bdff0e2d30fa7e9245bef474cb9')
sha256sums_x86_64=('1d0790b709e2c85b02da5a163f6bd8c061f15d8992bb3e58c4414af905906275')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Exec=\"${_pkgname}\"/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/icons/favicon/"*.png -t "${pkgdir}/usr/lib/${_pkgname}/icons/favicon"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
