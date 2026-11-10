# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=miteiru-bin
_pkgname=Miteiru
pkgver=8.2.0
pkgrel=1
pkgdesc="Free video player for learning Japanese, Mandarin, Cantonese and Vietnamese from what you watch. Click any subtitle word for its reading and offline dictionary meaning. Plays local files and YouTube, with dual subtitles, karaoke lyrics and Anki export."
arch=('x86_64')
url="https://miteiru.hocky.id/"
_ghurl="https://github.com/hockyy/miteiru"
license=("CC-BY-NC-4.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
	'libayatana-indicator'
	'libappindicator'
)
optdepends=(
    'mecab'
    'yt-dlp'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/hockyy/miteiru/v${pkgver}/LICENSE.md"
)
sha256sums=('bb426a9b0caa2587068507c1265a1f6110f3370fb8ee982a46e389eeef0c3e52'
            '32b8056672bc415bbd3829a9a737d776795f6b73af61ce0934107ed81ee8a7a0')
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
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _install_icons
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
