# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lotti-bin
_pkgname=Lotti
_debname="com.matthiasn.${pkgname%-bin}"
pkgver=1.1.6+4383
pkgrel=1
pkgdesc="A private logbook with a staff of personal AI assistants. Agents read what you record and propose what to do next — you approve the changes. End-to-end encrypted sync between your own devices — servers only ever see ciphertext. Local AI optional."
arch=('x86_64')
url="https://matthiasn.github.io/lotti/"
_ghurl="https://github.com/matthiasn/lotti"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'pango'
    'gdk-pixbuf2'
    'mpv'
    'gtk3'
    'libkeybinder3'
    'libsecret'
    'libepoxy'
    'cairo'
    'at-spi2-core'
    'harfbuzz'
    'libxmu'
    'gstreamer'
    'gst-plugins-base-libs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/${pkgver//_/+}/linux.x64.tar.gz"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('03dc7f523d7f38d4ae29c8fa681351122e3236d1cf09fbc4ece64c82d93523c3'
            '6c653ecadf03d9566022c30e03185a6cbfc1ab8de1c9ddec899bac356c4d40d7')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" -i "${srcdir}/usr/lib/${pkgname%-bin}/share/applications/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr" "${pkgdir}"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
