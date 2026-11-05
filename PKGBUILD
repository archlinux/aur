# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clash-of-rust-bin
_pkgname=Clash-of-Rust
pkgver=0.6.6
pkgrel=1
pkgdesc="Cross-platform client side based on Rust, Slint and mihomo."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Fu021/Clash-of-Rust"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glib2'
    'libgcc'
    'hicolor-icon-theme'
    'fontconfig'
    'mihomo'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
sha256sums_aarch64=('26d68f7ca7644a9e814751d515edf7c00e52da35094e0e3a75e13c672a8bb475')
sha256sums_x86_64=('bfd95ccb45d87e7f08fc60bde537e6bc67e28ad99131be327ced8bb5987a5636')
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
    sed -i "s/\/usr\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/bin/mihomo" "${srcdir}/opt/${pkgname%-bin}/resources/mihomo"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -a "${srcdir}/opt/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/cor" "${pkgdir}/usr/bin/cor"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/org.clashofrust.tun.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}
