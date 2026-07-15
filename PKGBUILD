# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=duckling-bin
_pkgname=Duckling
pkgver=0.51.0
pkgrel=1
pkgdesc="A fast viewer for CSV/Parquet files and databases such as DuckDB, SQLite, PostgreSQL, MySQL, Clickhouse, etc.(Prebuilt version)"
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
sha256sums=('065d7d8e3d46516064a75ab425a6271137fa14ce1a679367ae52266e5a507d72'
            'a57ebfdf4a7893bc2ba09a6f572c55a9f4052bebe8e6f33940df766ef61a1bcd')
prepare() {
    sed -i "s/Categories=/Categories=Development;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
