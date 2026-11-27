# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rauthy-bin
_pkgname='Rauthy TOTP'
pkgver=0.0.13
pkgrel=1
pkgdesc="An Opensource TOTP (Time-based One-Time Password) app that allow you to manage your 2FA (2 Factor Authentication) tokens. It is like Authy or Google Authenticator."
arch=('x86_64')
url="https://github.com/charlesschaefer/rauthy-totp"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('546d7392de56c39c84ab8cb454685d52f81d4aa1ea3892ecd52fe5bd295c8e9f')
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256) _src="${srcdir}/usr/share/icons/hicolor/256x256@2/apps/${pkgname%-bin}.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-bin}.png"
	done
}
prepare() {
	bsdtar -xf "${srcdir}/data."*
	sed -i -e "
		s/Comment=A Tauri App/Comment=${pkgdesc}/g
		s/Categories=/Categories=Utility;System/g
	" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
	_generate_icons
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}