# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=weread
pkgname="${_appname}-pake"
_pkgname=WeRead
pkgver=3.17.6
pkgrel=1
pkgdesc="Use Pake to package WeRead.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com/"
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
sha256sums=('3bbaa3b771fe1dda5008e129087c2f59f1515f0f715d74b820205605cb7cf010'
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
        s/${_appname}_512/${_appname};/g
    " "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/pake-${_appname}" "${pkgdir}/usr/bin/${_appname}"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    _install_icons
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
