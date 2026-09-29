# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imgo-bin
_pkgname=IMGo
pkgver=1.0.0
pkgrel=1
pkgdesc='IMGo (short for "image optimizer") is a private batch image compression and conversion tool. Process multiple images at once, adjust quality and dimensions, and convert between common formats without uploading your files.'
arch=(
    'aarch64'
    'x86_64'
)
url="https://imgo.app/"
_ghurl="https://github.com/meowtec/imgo"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libappindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('0b207a1e10685fb14776287da1b8c56a9da7f36d913241334571a48fc8717426')
sha256sums_x86_64=('722217d8adfdeb4f242c02741c0f326757fd54a3658bc5c2986966f8f513aeb8')
prepare() {
    sed -i "s/Name=${pkgname%-bin}/Name=${_pkgname}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    cp -a "${srcdir}/usr/lib" -t "${pkgdir}/usr"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}