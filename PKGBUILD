# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=duckling-bin
_pkgname=Duckling
pkgver=0.59.3
pkgrel=1
pkgdesc="A fast viewer for CSV/Parquet files and databases such as DuckDB, SQLite, PostgreSQL, MySQL, Clickhouse, etc."
arch=('x86_64')
url="https://github.com/l1xnan/duckling"
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
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/l1xnan/duckling/v${pkgver}/LICENSE"
)
sha256sums=('1af671989f98026376b81d9e0a54f463b32a08f3f9aa61446625273c85e16b01'
            'a57ebfdf4a7893bc2ba09a6f572c55a9f4052bebe8e6f33940df766ef61a1bcd')
prepare() {
    sed -i "s/Categories=/Categories=Development;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
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
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
