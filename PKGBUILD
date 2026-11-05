# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xiaohongshu
pkgname="${_appname}-pake"
_pkgname=XiaoHongShu
pkgver=3.18.0
pkgrel=1
pkgdesc="Use Pake to package XiaoHongShu.小红书 App,是年轻人的生活方式社区,每月有超过2亿人在这里分享生活经验,发现真实、美好、多元的世界,找到想要的生活 。"
arch=('x86_64')
url="https://www.xiaohongshu.com/"
_ghurl="https://github.com/tw93/Pake"
license=('MIT')
conflicts=("${pkgname%-pake}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('b8c5aa7839601202a92b81f8aa816411a2b29f91a907dd47d4cdfde9b37f7cb3'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
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
        s/pake-//g
        s/${_appname}_512/${_appname}/g
    " "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/pake-${_appname}" "${pkgdir}/usr/bin/${_appname}"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    _install_icons
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
