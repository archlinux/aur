# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=cline
pkgname="${_appname}-desktop-bin"
_pkgname=Cline
_debname="bot.${_appname}.app"
pkgver=0.0.50
pkgrel=1
pkgdesc="Cline AI coding agent."
arch=(
    'aarch64'
    'x86_64'
)
url="https://cline.bot/"
_ghurl="https://github.com/cline/cline"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}-cli"
)
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
)
options=('!strip')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/desktop-v${pkgver}/${_pkgname}_${pkgver}_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/desktop-v${pkgver}/${_pkgname}_${pkgver}_x86_64.rpm")
sha256sums_aarch64=('0b5286f5e2cfaeb5da431ab0f488ca7a85552d7b4b0ef900b15b8e75dc0b0e64')
sha256sums_x86_64=('2d90fed05fe2b63b58466ead273bc36dd3abdcc6c6ecea3a97c99309a0e8aff8')
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
        s/Exec=${_appname}-app/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}-app/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/${_pkgname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml"
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x86_64 || echo aarch64)
    find "${srcdir}" -name "*${_archrem}*" -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}-app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${_appname}-cli" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
