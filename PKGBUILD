# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# https://www.hoptodesk.com/changelog
pkgname=hoptodesk-bin
pkgver=1.46.80
pkgrel=1
pkgdesc="A free remote desktop tool that allows users to share their screens and remotely control access to their computers and devices."
arch=('x86_64')
url="https://www.hoptodesk.com"
_gitlaburl="https://gitlab.com/hoptodesk/hoptodesk"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'libpulse'
    'gst-plugins-base-libs'
    'gstreamer'
    'xdotool'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/${pkgname%-bin}.deb")
sha256sums=('SKIP')
pkgver() {
	cat "${srcdir}/.pkgver" 2>/dev/null || echo "${pkgver}"
}
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
    grep "Version=" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" | grep -v "X-Desktop" | sed "s/Version=//g" > "${srcdir}/.pkgver"
    sed -i "s/\/usr\/share\/icons\/hicolor\/128x128\/apps\/${pkgname%-bin}.png/${pkgname%-bin}/" \
        "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/128x128.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/files/systemd/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
}