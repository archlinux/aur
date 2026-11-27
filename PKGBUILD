# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=compressO
pkgname="${_appname//O/o}-bin"
_pkgname=CompressO
pkgver=4.3.0
pkgrel=1
pkgdesc="Convert any video/image/audio into a tiny size. 100% free & open-source."
arch=('x86_64')
url="https://github.com/codeforreal1/compressO"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
	'ffmpeg'
	'gifski'
	'pngquant'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('c6f9d191b368d122c7a63d214c6892ecab9c4bf97a7723db29bdc60f8be0957c')
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256) _src="${srcdir}/usr/share/icons/hicolor/256x256@2/apps/${_appname}.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-bin}.png"
	done
}
prepare() {
	bsdtar -xf "${srcdir}/data."*
	sed -e "
		s/Exec=${_appname}/Exec=${pkgname%-bin}/
		s/Icon=${_appname}/Icon=${pkgname%-bin}/
	" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
	find "${srcdir}" -type d \( -name "*aarch64*" -o -name "*darwin*" -o -name "*windows*" \) -exec rm -rf {} +
	ln -sf "/usr/bin/gifski" "${srcdir}/usr/lib/${_pkgname}/gifski/gifski"
	ln -sf "/usr/bin/ffmpeg" "${srcdir}/usr/lib/${_pkgname}/ffmpeg/ffmpeg"
	ln -sf "/usr/bin/ffprobe" "${srcdir}/usr/lib/${_pkgname}/ffmpeg/ffprobe"
	ln -sf "/usr/bin/pngquant" "${srcdir}/usr/lib/${_pkgname}/pngquant/pngquant"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}-cli" -t "${pkgdir}/usr/bin"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
	_generate_icons
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}