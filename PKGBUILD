# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-music-dl-bin
_pkgname="Go Music DL"
_rpmname=music-dl-desktop-go
pkgver=1.1.4
pkgrel=1
pkgdesc="一个基于 Go 语言的全网音乐搜索与下载工具。支持 CLI 命令行与 Web 服务双模式，内置网易云、QQ、酷狗、Bilibili、汽水音乐等 10+ 个主流平台，支持多源并发搜索与无损音质解析."
arch=('x86_64')
url="https://music.zkkp.nyc.mn/"
_ghurl="https://github.com/guohuiyuan/go-music-dl"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'ffmpeg'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_rpmname}-linux-amd64.rpm")
sha256sums=('ca123f5f25218062400e1b1a3d5cd453d6d4b5b9062793153336c92c7d5cc2f5')
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
    sed -i -e "
        s/Name=${_rpmname}/Name=${_pkgname}/g
        s/Exec=${_rpmname}/Exec=${pkgname%-bin}/g
        s/Icon=${_rpmname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_rpmname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_rpmname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_rpmname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _install_icons
}

