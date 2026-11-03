# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mudlet-bin
_pkgname=Mudlet
pkgver=5.1.0
pkgrel=1
pkgdesc="⚔️ A cross-platform, open source, and super fast MUD client with scripting in Lua."
arch=('x86_64')
url="https://www.mudlet.org"
_ghurl="https://github.com/Mudlet/Mudlet"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-declarative'
    'hicolor-icon-theme'
)
optdepends=(
    'ttf-bitstream-vera: default font'
    'ttf-ubuntu-font-family: default font'
    'noto-fonts-emoji: emoji font support'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar::${_ghurl}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}-linux-x64.AppImage.tar"
    "${pkgname%-bin}.sh"
)
sha256sums=('46dc6e4209ee0ca65a446b9c88e6504ddb6bdf0210dd6a2c664875a5624c8f10'
            '216b754c5be3b7d33ebc915743a3bc4d6663a63b0a07468c88cc26bf20908cb4')
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
    chmod +x "${srcdir}/${_pkgname}.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/${_pkgname%-bin}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/doc" -type f -exec chmod 644 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    _install_icons
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
