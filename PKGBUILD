# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fylepad-bin
pkgver=4.0.0
pkgrel=1
pkgdesc=" privacy-first intelligent writing workspace for note-taking and personal knowledge management. Rich text, Markdown, diagrams, and on-demand AI(Prebuilt version)"
arch=('x86_64')
url="https://fylepad.app/"
_ghurl="https://github.com/imrofayel/fylepad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}-zen-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/imrofayel/fylepad/app-v${pkgver}/LICENCE"
)
sha256sums=('dfd8c95d58673b98bf81f781d2040a5b03e8e6c412acf83f2b0ae74c11914bf4'
            '731dd8d0e66cfb62c0604953b3dcee595c85234708455752b70efd23c12c2ddb')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        s/Comment=A Tauri App/Comment=${pkgdesc}/
        s/Exec=${pkgname%-bin}-zen/Exec=${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-zen/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-zen.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}-zen" "${pkgdir}/usr/bin/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-zen.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
