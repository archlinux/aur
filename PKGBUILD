# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=compressO
pkgname="${_appname//O/o}-bin"
_pkgname=CompressO
pkgver=4.0.0
pkgrel=1
pkgdesc="A free and open-sourced cross-platform video compression app powered by FFmpeg."
arch=('x86_64')
url="https://github.com/codeforreal1/compressO"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'ffmpeg'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('adf27cdeb2818ae1da68d448b79aa56ddaae435932b9160ccaa7b527fcd269e3')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Exec=${_appname}/Exec=${pkgname%-bin}/
        s/Icon=${_appname}/Icon=${pkgname%-bin}/
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    local _icon_dir="${srcdir}/usr/share/icons/hicolor"
	[[ -d "${_icon_dir}/256x256@2" && ! -d "${_icon_dir}/512x512" ]] && mv "${_icon_dir}/256x256@2" "${_icon_dir}/512x512"
	find "${srcdir}" -type d \( -name "*aarch64*" -o -name "*darwin*" -o -name "*windows*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/bin/${pkgname%-bin}_ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${pkgdir}/usr/bin/${pkgname%-bin}_ffprobe"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}