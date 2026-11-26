# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chaski-bin
_pkgname=Chaski
pkgver=0.9.3
pkgrel=1
pkgdesc="A content aggregator that helps you focus on what matters."
arch=('x86_64')
url="https://chaski.a-chacon.com"
_ghurl="https://github.com/a-chacon/chaski-app"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
makedepends=(
    'imagemagick'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/app-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('1d14c4aaadb727156d1ecf0da40ffa95fe451be64093a31de98fabd13436d10c')
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256) _src="${srcdir}/usr/share/icons/hicolor/256x256@2/apps/${pkgname%-bin}.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-git}.png"
	done
}
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=Utility;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    _generate_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}