# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=somafm-desktop-player-bin
_pkgname='SomaFM Desktop Player'
pkgver=0.1.2
pkgrel=1
pkgdesc="A small desktop player for SomaFM radio, built with Tauri and React."
arch=('x86_64')
url="https://alechko.github.io/somafm-desktop-player/"
_ghurl="https://github.com/alechko/somafm-desktop-player"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}-${pkgver}-1.x86_64.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/alechko/somafm-desktop-player/v${pkgver}/LICENSE.md"
)
sha256sums=('c465a102304e30d01d25ec5830a1b27497857f03fe9463f5cc3cfcfaa8235693'
            '5e404eae8a20b20c3e2ab7e0a08d04012d2cf8d5bf266849a22d7aa810409381')
prepare() {
    sed -i "s/Categories=/Categories=AudioVideo/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}