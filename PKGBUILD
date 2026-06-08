# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=codenest-bin
_pkgname=CodeNest
pkgver=1.0.0
pkgrel=1
pkgdesc="A local project management tool that helps organize projects scattered across different locations on your disk.(Prebuilt version)一款本地项目管理工具，可整理分散在磁盘各处的项目"
arch=('x86_64')
url="https://github.com/MidnightCrowing/CodeNest"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('55ce7f0c4a01166adf4f27cb1fc153f9f9f6ff2d10f4c34847e515062d47b3ff')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/_up_/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}