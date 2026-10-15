# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tauri-motrix-bin
_pkgname=Tauri.Motrix
pkgver=0.2.5
pkgrel=1
pkgdesc="A full-featured download manager written in Tauri.The purpose is to restructure Motrix open source project."
arch=(
	'aarch64'
	'x86_64'
)
url="https://tauri-motrix-website.vercel.app/"
_ghurl="https://github.com/Taoister39/tauri-motrix"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
	'libayatana-indicator'
	'libappindicator'
    'aria2'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('72a5b85df06ef64d5fe5f3641cf06d91bfb2b091a6e5f41b2e90e3bcb494342c')
sha256sums_x86_64=('224679600aa038bd45dae6a87c9431702dacfdf818564da9e3001c6762c94365')
prepare() {
    bsdtar -xf "${srcdir}/data."*
	sed -i -e "
		s/Categories=Utility;/Categories=Network;/g
		/Comment/d
        4i\Comment=${pkgdesc}
	" "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop"
	[[ -d "${srcdir}/usr/share/icons/hicolor/256x256@2" ]] && mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
	find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}