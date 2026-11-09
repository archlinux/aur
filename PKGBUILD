# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lyricade-bin
_pkgname=Lyricade
pkgver=0.6.0
pkgrel=1
pkgdesc="A Linux desktop application for fetching and managing lyrics in your local music library. It will scan your music and download missing lyrics, in either synchronised LRC or plain text format, at your preference."
arch=('x86_64')
url="https://github.com/weiteck/lyricade"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
	'gtk4'
	'libadwaita'
    'alsa-lib'
	'libayatana-indicator'
	'libappindicator'
)
source=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-x86_64.AppImage")
sha256sums=('c1577c86c476c9cf92705b41430b21d9250324e5badf2832a3d37123a1d25355')
_install_icons() {
	local _src="${1:-${srcdir}}" _name="${pkgname%-bin}" _icon _ext _size _dest
	while IFS= read -r -d '' _icon; do
		_ext="${_icon##*.}"
		_size=$(echo "${_icon%/*}" | grep -oE '[0-9]+x[0-9]+|scalable' | head -1)
		[[ -z "${_size}" ]] && _size=$([[ "${_ext}" == svg ]] && echo scalable || od -An -tu1 -j16 -N8 "${_icon}" 2>/dev/null | awk '{printf "%dx%d",$1*16777216+$2*65536+$3*256+$4,$5*16777216+$6*65536+$7*256+$8}')
		[[ "${_size}" =~ ^[0-9]+x[0-9]+$ ]] || _size=scalable
		_dest=$([[ "${_icon}" == */share/pixmaps/* ]] && echo pixmaps || echo "icons/hicolor/${_size}/apps")
		install -Dm644 "${_icon}" "${pkgdir}/usr/share/${_dest}/${_name}.${_ext}"
	done < <(find "${_src}" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' -o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
prepare() {
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    rm -rf "${srcdir}/squashfs-root"
	"${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
	install -Dm755 "${srcdir}/squashfs-root/usr/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	_install_icons
	install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
