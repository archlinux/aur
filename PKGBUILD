# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-pdf-studio-bin
_pkgname=Open.PDF.Studio
pkgver=1.93.1
pkgrel=1
pkgdesc="A free, open-source PDF editor and annotator.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/OpenAEC-Foundation/open-pdf-studio"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('9d19b100b7fea996b52532072df37070048e93970c9691280b4e7e80d4067625')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=Office;/" "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
