# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lyricade-bin
_pkgname=Lyricade
_debname="io.github.weiteck.${_pkgname}"
pkgver=0.7.1
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
	'libheif'
)
options=('!strip')
source=(
	"${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-x86_64.AppImage"
	"lyricade.sh"
)
sha256sums=('898833553550f5fee03be03fe55b39d7af3fdd0b41926915d24773659713d31d'
            '4ced1d6c43351b9daa0a4e34a6447d6166c00073faba4a18900ae9c53755c814')
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
	sed -i "s/@appname@/${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    rm -rf "${srcdir}/squashfs-root"
	"${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
	sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" "${srcdir}/AppDir/${_debname}.desktop"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "${srcdir}/AppDir/." "${pkgdir}/usr/lib/${pkgname%-bin}"
	install -Dm644 "${srcdir}/AppDir/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/AppDir/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}