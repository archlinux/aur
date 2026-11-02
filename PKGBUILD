# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=triproxy-bin
_pkgname=TriProxy
pkgver=0.2.3
pkgrel=1
pkgdesc="A modern multi-core proxy client: unified lifecycle management for Mihomo, sing-box and Xray."
arch=('x86_64')
url="https://github.com/luoqingciya/TriProxy"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
    'mihomo'
    'xray'
    'sing-box'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64-lite.deb")
sha256sums=('d789162e9773bfa46a9a287ee3cb94456893092e7e0cfad3ffb3f0d97b2ffddf')
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
    sed -i -e "
        s/Exec=${pkgname%-bin}-app/Exec=${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-app/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm755 -d "${srcdir}/usr/lib/${_pkgname}/cores"
    ln -sf "/usr/bin/mihomo" "${srcdir}/usr/lib/${_pkgname}/cores/xray"
    ln -sf "/usr/bin/xray" "${srcdir}/usr/lib/${_pkgname}/cores/xray"
    ln -sf "/usr/bin/sing-box" "${srcdir}/usr/lib/${_pkgname}/cores/sing-box"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}-app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
