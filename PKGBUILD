# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sparus-bin
_pkgname=Sparus
pkgver=0.6.0
pkgrel=1
pkgdesc="A simple game launcher to start and keep your game up-to-date !(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Ludea/Sparus"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('bbe0cd5828f79f98863540a309ed2eb252e09b5ea9849d94ccd06d68b69e1ee9')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        3i\Comment=${pkgdesc}/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
