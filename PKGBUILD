# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=printnotes-bin
_pkgname=PrintNotes
pkgver=0.10.8
pkgrel=1
pkgdesc="A cross-platform markdown notes app inspired by Google Keep and Obsidian.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/RoBoT095/printnotes"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}+17-linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('24df7e97cd24add57ecc3635f271ab508099c41c892788c14d6e3026cef57c65'
            'd7002fa1a9ae60749490e982fa8a4f4622f7381b02559f5b014df033c0773a3c')
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
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/com.${pkgname%-bin}.${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/usr/share/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
}
