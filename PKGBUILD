# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postbird-bin
_pkgname=Postbird
pkgver=0.9.0
pkgrel=1
pkgdesc="Open source PostgreSQL GUI client."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Paxa/postbird"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'glibc'
	'hicolor-icon-theme'
)
options=(
	'!strip'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Paxa/postbird/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.deb")
sha256sums=('d93e84fa24bbea7e92d6cd171968d8da1f4a28047cc704f0700d17b57c7a9a9c')
sha256sums_aarch64=('de097b53155fca2d36ef74e93cac22c0bf1772b475382cd6219ecde26304a171')
sha256sums_x86_64=('d49c0bbe373398dbf39076810d6ef23fa66adb041c3ddd607753a5b96b019b4f')
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
    sed -i "s/Exec=\/opt\/${pkgname%-bin}\/${_pkgname}/Exec=${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/opt/${pkgname%-bin}/bin/launcher" "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	cp -a "${srcdir}/opt/${pkgname%-bin}/Resources" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _install_icons
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}