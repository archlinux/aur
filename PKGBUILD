# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netsonar-bin
_pkgname=NetSonar
_debname="pt.ptrtech.${_pkgname}"
pkgver=0.5.1
pkgrel=1
pkgdesc="A network diagnostics tool for pinging hosts (ICMP/TCP/UDP/HTTP), managing network interfaces, and discovering local devices/services."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/sn4k3/NetSonar"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'fontconfig'
    'glibc'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/${pkgver}/${_pkgname}_linux-arm64_v${pkgver}.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/${pkgver}/${_pkgname}_linux-x64_v${pkgver}.rpm")
source=("${pkgname%-bin}.sh")
sha256sums=('587630b858a37bc5b30f31af8d7e7f40c8c3b3cc3c2835278fabc13c79860485')
sha256sums_aarch64=('7ca1f2db1abc7f2b9165d6167990602c52cb8a4e2d97bdd0b8b35380a23a0d27')
sha256sums_x86_64=('e1df8cc703587cc93f4210a3e17b66998c4d43d3fbb778f94e403289304f69e7')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${_debname}.appdata.xml"
    rm -rf "${srcdir}/usr/lib/.build-id"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/usr/"{bin,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
