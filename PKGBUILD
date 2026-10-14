# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jet-pilot-bin
_pkgname=JET.Pilot
pkgver=2.1.2
pkgrel=1
pkgdesc="An open-source Kubernetes desktop client that focuses on less clutter, speed and good looks."
arch=(
    'aarch64'
    'x86_64'
)
url="https://jet-pilot.app/"
_ghurl="https://github.com/unxsist/jet-pilot"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/unxsist/jet-pilot/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1')
sha256sums_aarch64=('773b758aa74cb4fa664ccaaec11b1f04310d3134ea5ce5d6826d81c2028991ec')
sha256sums_x86_64=('5af0ff2b5ac4346b382228bd60502b657810a30ee27a265f228e3d5092048a48')
prepare() {
    sed -i -e "
        s/Exec=\"${_pkgname//./ }\"/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname//./ }/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname//./ }" "${pkgdir}/usr/bin/${pkgname%-bin}"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
