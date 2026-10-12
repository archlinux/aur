# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=scramblery-bin
_pkgname=Scramblery
pkgver=4.0.2
pkgrel=1
pkgdesc="Desktop app for image and video scrambling with various methods including Fourier phase scramble: Entire image/video or just detected facial area."
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
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/altunenes/scramblery/v${pkgver}/LICENSE"
)
sha256sums=('7bf34e086c41fbdaf7e996d1593409a03f712e2a4470fdc25cf8104ee5a6ae96'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        /Comment=/d
        4i\Comment=${pkgdesc}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
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
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
