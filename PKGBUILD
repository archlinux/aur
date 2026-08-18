# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=scramblery-bin
_pkgname=Scramblery
pkgver=3.0.3
pkgrel=1
pkgdesc="Desktop app for image and video scrambling with various methods including Fourier phase scramble: Entire image/video or just detected facial area.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/altunenes/scramblery"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/altunenes/scramblery/v${pkgver}/LICENSE"
)
sha256sums=('d7a717f3721c50d2d1bd663dd392172f760ce57f2fe2a5592d8a743ac52ee28e'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        /Comment=/d
        4i\Comment=${pkgdesc}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/models/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources/models"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}