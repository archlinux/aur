# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=markflowy-bin
_pkgname=MarkFlowy
pkgver=0.88.0
pkgrel=1
pkgdesc="Modern markdown editor application, Build fast and efficient workflows.(Prebuilt version)"
arch=('x86_64')
url="https://markflowy.vercel.app/"
_ghurl="https://github.com/drl990114/MarkFlowy"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('ad5f28de2c1f69b713c24924a83e4d5d798a615da87e52b14b7f7de4aea8c07f')
prepare() {
    sed -i "s/Development/Utility/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
}
