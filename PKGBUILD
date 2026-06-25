# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hype-bin
_pkgname=Hype
pkgver=2.0.3
pkgrel=1
pkgdesc="Find Hype moments from Twitch.tv.(Prebuilt version)"
arch=('x86_64')
url="https://hype.lol/"
_ghurl="https://github.com/TimIsOverpowered/Hype"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'ffmpeg'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('57fb2c1631f205c7debffbc6d1783fc96ea306cdbcfb6b32772a01bf9e704ad7')
prepare() {
    sed -i "s/Categories=/Categories=Utility;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
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
}
