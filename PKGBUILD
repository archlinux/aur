# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
_pkgname='Mogan STEM'
pkgver=2026.3.9
pkgrel=1
pkgdesc="Mogan STEM Suite (based on GNU TeXmacs): Enjoy exploring science and technology!"
arch=('x86_64')
url="https://mogan.app/"
_ghurl="https://github.com/XmacsLabs/mogan"
_libgit2url="https://github.com/libgit2/libgit2"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gawk'
    'python-pillow'
    'python-matplotlib'
    'freetype2'
    'python'
    'fontconfig'
    'libglvnd'
    'libx11'
    'qt6-base'
    'qt6-declarative'
    'libxkbcommon'
    'fcitx5-qt'
    'hicolor-icon-theme'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-stem-v${pkgver}-debian13-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9d0feeb0c678a1b9de443e71f4f8b455063399cdd492497c4577a3c569556c5f'
            '0995ecbfb6b721d08c61ff98c05501e4f74a5cee57c2c9a3864d0c7171ea2e82')
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
        s/@runname@/${pkgname%-bin}stem/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=\/opt\/${pkgname%-bin}-stem\/bin\/${pkgname%-bin}stem/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname// /}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname// /}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    cp -a "${srcdir}/opt/${pkgname%-bin}-stem/"{bin,lib,plugins,translations} \
        "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${pkgname%-bin}-stem/share/"{doc,"${pkgname%-bin}"lab} \
        "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    _install_icons
    _mime_types_size=(16x16 20x20 22x22 24x24 32x32 36x36 40x40 48x48 64x64 72x72 96x96 128x128 192x192 256x256 512x512)
    for _mt_size in "${_mime_types_size[@]}";do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_mt_size}/mimetypes/texmacs-document.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_mt_size}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname// /}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/mime/packages/texmacs.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}
