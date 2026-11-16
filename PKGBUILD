# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dosbox
pkgname="${_pkgname}-staging-bin"
_appname="org.${pkgname%-bin}.${pkgname%-bin}"
pkgver=0.83.1
pkgrel=1
pkgdesc="A modern continuation of DOSBox with advanced features and current development practices."
arch=('x86_64')
url="https://www.dosbox-staging.org/"
_ghurl="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL-2.0-or-later')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_pkgname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    'alsa-lib'
    'sdl3'
    'libglvnd'
    'sdl2_image'
    'sdl2_net'
    'sdl2-compat'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('3c7c925e28a5c88ae9f9f1a315ad07d91176b135fbe5f6f240eeee148ed176b0'
            '31f838fa163601ee51a0475cbc36ca97ac75cdfff538ce56d7097a09112093e3')
_install_icons() {
	local _src="${1:-${srcdir}}" _name="${pkgname%-bin}" _icon _ext _size _dest
	while IFS= read -r -d '' _icon; do
		_ext="${_icon##*.}"
		_size=$(echo "${_icon%/*}" | grep -oE '[0-9]+x[0-9]+|scalable' | head -1)
		[[ -z "${_size}" ]] && _size=$([[ "${_ext}" == svg ]] && echo scalable || od -An -tu1 -j16 -N8 "${_icon}" 2>/dev/null | awk '{printf "%dx%d",$1*16777216+$2*65536+$3*256+$4,$5*16777216+$6*65536+$7*256+$8}')
		[[ "${_size}" =~ ^[0-9]+x[0-9]+$ ]] || _size=scalable
		_dest=$([[ "${_icon}" == */share/pixmaps/* ]] && echo pixmaps || echo "icons/hicolor/${_size}/apps")
		install -Dm644 "${_icon}" "${pkgdir}/usr/share/${_dest}/${_name}.${_ext}"
	done < <(find "${_src}" \( -path '*/icons/hicolor/*' -o -path '*/share/pixmaps/*' -o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}-linux"*/desktop/*.desktop
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/${pkgname%-bin}-linux"*/* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux"*/desktop/*.desktop "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _install_icons
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux"*/man/"${_pkgname}".1 -t "${pkgdir}/usr/share/man/man1"
}