# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dosbox
pkgname="${_pkgname}-staging-bin"
_appname="org.${pkgname%-bin}.${pkgname%-bin}"
pkgver=0.83.0
pkgrel=3
pkgdesc="A modern continuation of DOSBox with advanced features and current development practices.(Prebuilt version)"
arch=('x86_64')
url="https://www.dosbox-staging.org/"
_ghurl="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL-2.0-or-later')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_pkgname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    'alsa-lib'
    'sdl3'
    'libglvnd'
    'sdl2_image'
    'sdl2_net'
    'sdl2-compat'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('d3a94f7f1c3e68a47ec88d61145506c7904452adb0c9c5928cb8cfe2331d6c5c'
            '5e664ddfd6f8016b079a4244fdc5746a253658554324f73dc5e406bf7d354456')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}-linux"*/desktop/*.desktop
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/${pkgname%-bin}-linux"*/* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux"*/desktop/*.desktop "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux"*/man/"${_pkgname}".1 -t "${pkgdir}/usr/share/man/man1"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*icons/hicolor/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
}