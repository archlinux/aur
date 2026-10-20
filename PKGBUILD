# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rowel-bin
_pkgname=Rowel
pkgver=1.0.3
pkgrel=1
pkgdesc="Free Offline-first Password Manager."
arch=('x86_64')
url="https://rowel.app/"
_ghurl="https://github.com/fwdai/rowel"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('8d1ded9b53878a4e6d4e62bfbc2d6a2e72fff295d1a555e78dcf77a3267305b1')
prepare() {
    sed -i "s/Categories=/Categories=System;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    local _icon_dir="${srcdir}/usr/share/icons/hicolor"
    [[ -d "${_icon_dir}/256x256@2" && ! -d "${_icon_dir}/512x512" ]] && mv "${_icon_dir}/256x256@2" "${_icon_dir}/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}