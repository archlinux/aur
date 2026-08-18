# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=syng-bin
_pkgname=Syng
pkgver=2.1.0
_zhsname='词应'
pkgrel=1
pkgdesc="A free, open source, cross-platform, Chinese-To-English dictionary for desktops.(Prebuilt version)"
arch=('x86_64')
url="https://getsyng.com/"
_ghurl="https://github.com/sotch-pr35mac/syng"
license=(
    'GPL-3.0-only'
    'LicenseRef-CC-CEDICT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/sotch-pr35mac/syng/v${pkgver}/LICENSE-CC-CEDICT"
)
sha256sums=('780e97b2fc3ffee6d992e26368da5a0a1a8148b3625af45beae0c3ec0f78c683'
            '997e0e57760a71dfc656727d5bc14149bae55f907990f8c75650673924434f0c')
prepare() {
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/
        3i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/licenses/"* -t "${pkgdir}/usr/lib/${_pkgname}/resources/licenses"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
