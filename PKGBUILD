# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rayburst-bin
_pkgname=Rayburst
pkgver=4.1.2
pkgrel=1
pkgdesc="Redefining the open-source download manager."
arch=(
    'aarch64'
    'x86_64'
)
url="https://rayburst.pages.dev/"
_ghurl="https://github.com/AnInsomniacy/rayburst"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'libappindicator'
    'hicolor-icon-theme'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/AnInsomniacy/rayburst/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('82e71190970399412c9e40fc3f4e2dc1cb070d56433ee7f25af7a4e67f401f0e')
sha256sums_aarch64=('dc88b99a10a7ad52f0841644f618b446f9f63b2a26e3e221dbe45beaa868c812')
sha256sums_x86_64=('931469ca1464fee3382059235ad54f39df5c18c8c67766bb98be5f905576424a')
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
    sed -i "s/Categories=/Categories=Network;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/lib/${_pkgname}/bin"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
