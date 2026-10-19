# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dockit-bin
_pkgname=DocKit
pkgver=2.0.0
pkgrel=1
pkgdesc="Agentic desktop GUI client for Elasticsearch, OpenSearch, DynamoDB, MongoDB & EasySearch. Natural language queries, visual management, and monitoring. Privacy-first. Open source."
arch=('x86_64')
url="https://www.geekfun.club/products/dockit/"
_ghurl="https://github.com/geek-fun/dockit"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('0e76539f860db4e880e5f15dcf759c0b3e5186492e572ec64ede3178d66809c8')
prepare() {
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    [[ -d "${srcdir}/usr/share/icons/hicolor/256x256@2" ]] && mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
