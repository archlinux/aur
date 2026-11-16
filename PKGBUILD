# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youwee-bin
_pkgname=Youwee
pkgver=0.21.0
pkgrel=1
pkgdesc="A beautifull YouTube, TikTok, Instagram and 1800+ sites downloader (yt-dlp GUI) and AI summary video content for cross-platform."
arch=('x86_64')
url="https://github.com/vanloctech/youwee"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'yt-dlp'
    'ffmpeg'
    'bun'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-Linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/vanloctech/youwee/v${pkgver}/LICENSE"
)
sha256sums=('806598fc53de5b930a13714bd2b850be1d039630c9d16ccde1340ab643edcbd6'
            '1cea78a161f726406b7611610171f5ac0e42b620126334e1150084179faf5b7b')
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
    sed -i "s/Categories=/Categories=AudioVideo;Utility/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}