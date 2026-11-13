# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ifind-bin
_pkgname=iFinD
_appname="com.51${pkgname%-bin}"
pkgver=3.10.30.404.001
pkgrel=1
pkgdesc="同花顺iFinD PC版提供资讯、行情、深度资料、数据浏览器、企业库等功能,满足用户多方面的使用需求。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.51ifind.com/"
_dlurl="https://sp.thsi.cn/staticS3/mobileweb-upload-static-server.file/app_6/downloadcenter"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    '!emptydirs'
    'staticlibs'
)
depends=(
    'gtk3'
    'cairo'
    'pango'
    'nss'
    'hicolor-icon-theme'
    'alsa-lib'
    'libxrandr'
    'libxkbcommon'
    'libcups'
    'libxcomposite'
    'libxdamage'
    'at-spi2-core'
    'libva'
    'libdrm'
    'mesa'
    'fontconfig'
    'dotnet-sdk-5.0'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${_appname}_uos_${pkgver}_arm64_signed.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${_appname}_${pkgver}_amd64_signed.deb")
sha256sums=('b2c139edf36eb4d21ee90620fd9dae460cc63269afcab8eee2fb9b9cb58f2c4f')
sha256sums_aarch64=('47c6d4cb9f49311fdf7b227f2ee0a3cc286c4c9170080a0720ad94bf31b56a34')
sha256sums_x86_64=('5bc34abc023b2f08c54d7d9fdc23fb9a9cc75cdc0b338996fea027c94daf0db3')
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
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/apps\/${_appname}\/files\/bin\/run.sh\"/${pkgname%-bin} %F/g
        s/\/opt\/apps\/${_appname}\/entries\/icons\/hicolor\/scalable\/apps\/${_appname}.svg/${pkgname%-bin}/g
        s/Name=${_appname}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/apps/${_appname}/files/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    _install_icons
    install -Dm644 "${srcdir}/opt/apps/${_appname}/files/cef/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/share/dotnet/shared/Microsoft.NETCore.App/5.0.17/libSystem.IO.Compression.Native.a" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/libSystem.IO.Compression.Native.a"
    ln -sf "/usr/share/dotnet/shared/Microsoft.NETCore.App/5.0.17/libSystem.Native.a" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/libSystem.Native.a"
    ln -sf "/usr/share/dotnet/shared/Microsoft.NETCore.App/5.0.17/libSystem.Net.Security.Native.a" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/libSystem.Net.Security.Native.a"
    ln -sf "/usr/share/dotnet/shared/Microsoft.NETCore.App/5.0.17/libSystem.Security.Cryptography.Native.OpenSsl.a" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/libSystem.Security.Cryptography.Native.OpenSsl.a"
}
