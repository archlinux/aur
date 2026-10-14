# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=silence_speedup
pkgname="${_appname//_/-}-bin"
_pkgname=Silence-SpeedUp
pkgver=3.0.0
pkgrel=1
pkgdesc="Shorten lectures, interviews and tutorials by speeding up or cutting the silences. Flutter desktop app with FFmpeg built in."
arch=('x86_64')
url="https://www.vincenzopadula.it/silence-speedup/"
_ghurl="https://github.com/padvincenzo/silence-speedup"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'at-spi2-core'
    'libepoxy'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('6e134b04b8d3106a93abac00e8418739234567d73ead6ce8c711d914d4bc4b03'
            'f003b130010311751a619cae8188af15f003369d71c59f7b34bbc26c98e615d5')
_get_app_dir() {
	find "${srcdir}" -type d -name "data" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/data" && -d "${d}/lib" ]] && { echo "$d"; return 0; }; done
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo;Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "$(_get_app_dir)/data/flutter_assets/assets/icons/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
