# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kanbanflow-app-bin
_pkgname=KanbanFlow.App
pkgver=2.0.0
pkgrel=1
pkgdesc="A standalone application for Kanbanflow.com."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/metawave/kanbanflow-app"
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
source=("LICENSE-${pkgver}.md::https://raw.githubusercontent.com/metawave/kanbanflow-app/v${pkgver}/LICENSE.md")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('4dcd2e7fe6343b8c84f2996f9713c67ee8e917c8e3606ce9ec221279ac5bfc26')
sha256sums_aarch64=('a0c1e846183e1a5c87c082003bcc56fd6a02b4a387154a3da4c72e7efd695c9d')
sha256sums_x86_64=('f7e2a6c89aeaf25853462a429dafc09faef394b6f141942aac435af01a34e789')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}