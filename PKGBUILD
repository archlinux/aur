# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spaceknife-bin
_pkgname=SpaceKnife
pkgver=0.3.6
pkgrel=1
pkgdesc="A modern cross-platform disk usage analyzer with a live treemap.现代化的跨平台硬盘占用分析工具，实时树图"
arch=(
    'aarch64'
    'x86_64'
)
url="https://spaceknife.kaltsit.dev"
_ghurl="https://github.com/DuskXi/SpaceKnife"
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
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=("${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/DuskXi/SpaceKnife/v${pkgver}/site/public/icon-512.png"
        "${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64-tauri.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64-tauri.tar.gz")
sha256sums=('fe565afa07a5cc5977f66594f3942f9019b19edcddd94f3984b00cd3dfd607bc'
            'ce404a41eba50acbb5f4907faea65314f909695b14e81e20aad4e5691dd79e8a')
sha256sums_aarch64=('f9b962972727a74e2e2ba8ac121cd9fc16f47a4c54965ae6cf39f82a33c666a4')
sha256sums_x86_64=('68c83643c99383ea9da6e05001baa8fe8db02e3c889916c92522d16f1e4c7cd5')
_get_app_dir() {
	find "${srcdir}" -type f -name "${pkgname%-bin}" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
prepare() {
    sed -i -e "
		s/@appname@/${pkgname%-bin}/g
        s/@pkgname@/${_pkgname}/g
	" "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_app_dir)/licenses/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}