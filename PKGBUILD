# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Gyara <laxect39@gmail.com>
_pkgname=helio
pkgname="${_pkgname}-workstation-bin"
_debname="fm.${_pkgname}.Workstation"
_appname=Helio
pkgver=3.18
pkgrel=1
pkgdesc="A free and open-source music sequencer for desktop and mobile platforms."
arch=('x86_64')
url="https://helio.fm/"
_ghurl="https://github.com/helio-fm/helio-sequencer"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libglvnd'
    'freetype2'
    'hicolor-icon-theme'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://ci.helio.fm/${_pkgname}-${pkgver}-x64.deb"
)
sha256sums=('af2f6d74c34ec04c6c1ab728955f6e14d2b32e22a848414492690b33f7ccb9a2')
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
    sed -i "s/\/usr\/bin\/${_pkgname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml"
}
package(){
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}