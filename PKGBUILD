# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quickpdfjoin-bin
_pkgname='Quick PDF Join'
_appname=QuickPdfJoin
pkgver=1.2026.11.11
pkgrel=1
pkgdesc="Quick PDF Join is a cross-platform application that joins multiple PDF files together."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/mihnea-radulescu/quickpdfjoin"
license=(
    "GPL-3.0-only"
    "MIT"
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'fontconfig'
    'dotnet-runtime>=10'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'icoutils'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_x64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('088a945383def01b8512d96ce68cc3c2035e64056c5539302be36e6f730290bd')
sha256sums_aarch64=('38c385bd5cf53fb320c3f4e90a55141d76383808d321d1e9f6ae20c3e653c6e9')
sha256sums_x86_64=('53f3e72ab5d377c8ea31aa80bc4661422654a9560c7f038dd861ad5e854d3016')
_get_app_dir() {
	find "${srcdir}" -type f -name "${_appname}" -printf '%h\n' 2>/dev/null
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    icotool -i 1 -x "$(_get_app_dir)/ApplicationIcon.ico" -o "${srcdir}/${pkgname%-bin}.png"
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
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_app_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
