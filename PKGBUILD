# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=container-desktop-bin
_pkgname='Container Desktop'
pkgver=6.1.0
pkgrel=1
pkgdesc="Podman desktop companion.A familiar desktop graphical interface to the free and open container manager, podman!"
arch=(
    'aarch64'
    'x86_64'
)
url="https://iongion.github.io/container-desktop/"
_ghurl="https://github.com/iongion/container-desktop"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=(
    'podman'
    'docker'
    'gtk3'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-aarch64-${pkgver}.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.pacman")
sha256sums_aarch64=('57fbce5eab100b4e94986cd2701cd5a2f5fcc6bf67fc0c7524791921e5d5b073')
sha256sums_x86_64=('67db89d4633d3e3dd0b23ce1d4651a1245cb18e06f26e52a7868c38c7f7fd0b6')
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
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
