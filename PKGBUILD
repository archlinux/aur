# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=libreget-bin
_pkgname=LibreGet
_orginame=omniget
_orgipkgname=OmniGet
pkgver=0.16.6
pkgrel=1
pkgdesc="Open-source download manager for courses (Udemy/Hotmart), YouTube, music & 1,800+ sites."
arch=(
    'aarch64'
    'x86_64'
)
url="https://t.me/OpenSelena"
_ghurl="https://github.com/OpenSelena/libreget"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_orgipkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_orgipkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('256298549f8421c75764399871179bb58c88a85440149468f5297b8c2a30e58d')
sha256sums_x86_64=('3710b73a51511db291d1268f4ebb162caf823e599a8969841a1e71d26dd9a52a')
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
    sed -i -e "
        s/${_orgipkgname}/${_pkgname}/g
        s/${_orginame}/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_orgipkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_orginame}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_orgipkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}