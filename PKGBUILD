# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stockholm-trekkers-playlist-maker-bin
_pkgname='Stockholm Trekkers Playlist Maker'
pkgver=4.3.1
pkgrel=1
pkgdesc="An Electron app for making video playlists.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/VenaStrom/Stockholm-Trekkers-Playlist-Maker"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname// /.}_${pkgver}_amd64.deb")
sha256sums=('50f0b543ea9745ebe95eec183f7bf318b9343428b97c95c9202e2ef0ca098861')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=AudioVideo;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/video-assets/"* -t "${pkgdir}/usr/lib/${_pkgname}/video-assets"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}