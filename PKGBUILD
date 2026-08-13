# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qcalc-bin
_pkgname=Q.Calc
pkgver=0.13.0
pkgrel=1
pkgdesc="A multi-purpose calculator for productivity and accessibility.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/from104/qcalc"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/from104/qcalc/v${pkgver}/LICENSE"
)
sha256sums=('099dc0daf5cf4c218b65705fff5875c470521662e8d447c10a0738ca0b3ea75c'
            '3987b48fb3c79907511fb74614201dbf40f9bff0cc691d4f2dbcad754cba519b')
prepare() {
    sed -i -e "
        s/Exec=app/Exec=${pkgname%-bin}/g
        s/StartupWMClass=app/StartupWMClass=${_pkgname}/g
        s/Icon=app/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
