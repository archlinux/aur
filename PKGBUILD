# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: XelK
# Contributor: Javier Tiá <javier dot tia at gmail dot com>
pkgname=vnote-bin
_pkgname=VNote
pkgver=4.13.0
pkgrel=1
pkgdesc="A Qt-based, free and open source note-taking application, focusing on Markdown now."
arch=('x86_64')
url="https://docs.vnote.fun/"
_ghurl="https://github.com/vnotex/vnote"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nss'
    'freetype2'
    'fribidi'
    'alsa-lib'
    'libx11'
    'qt6-declarative'
    'libxcb'
    'qt6-webengine'
    'qt6-svg'
    'qt6-5compat'
    'qt6-webchannel'
)
options=(
    '!strip'
    '!emptydirs'
    '!staticlibs'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('33e13210ba38e691a5b1e46c2cbd408fc70cbd17c24a9ce013a3468d6373c82d'
            '7feea40a0bd1a6668b2acf9adccf1678fb1f0c00f02fd688699cc51e92ca95da')
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
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
	rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} +
    find "${srcdir}/squashfs-root/usr/share/doc" -type f -perm 777 -exec chmod 444 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/usr/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    _install_icons
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
