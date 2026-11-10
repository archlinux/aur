# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quba-bin
_pkgname=Quba
pkgver=2.0.0
pkgrel=2
pkgdesc="A cross platform open source application to display structured (i.e., XML) and hybrid (Factur-X/ZUGFeRD PDF) electronic invoices."
arch=('x86_64')
url="https://github.com/ZUGFeRD/quba-viewer"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'nss'
    'nspr'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('37827826dad433ce02c46dddc852671b1dbd7cc1b6e4278ac6030cf7c5a08eaa'
            '32b37ffc525378a5ee197ee3b21e523ac5971f4dfe19c7a9c78484433033c16b')
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
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/bin\/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Categories=OpenIndex-ZUGFeRD/Categories=Utility;/g
        s/Exec=\/opt\/OpenIndex-${_pkgname}\/${pkgname%-bin}\/bin\/${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=\/opt\/OpenIndex-${_pkgname}\/${pkgname%-bin}\/lib\/${_pkgname}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/OpenIndex-${_pkgname}/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/OpenIndex-${_pkgname}/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    _install_icons
    install -Dm644 "${srcdir}/opt/OpenIndex-${_pkgname}/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
