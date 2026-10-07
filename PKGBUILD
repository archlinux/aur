# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jet-pilot-bin
_pkgname=JET.Pilot
pkgver=2.0.0
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
sha256sums_aarch64=('b9c86d0d364ba0d3704a31179920be17cdcec716e8f7951c4c9b2b9e7d9e202c')
sha256sums_x86_64=('ffb5779d8d994e8be60559c3f74e7eae865fc7e7d9550ba1c312d54c142ba6f0')
prepare() {
    sed -i -e "
        s/Exec=\"${_pkgname//./ }\"/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname//./ }/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname//./ }" "${pkgdir}/usr/bin/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}