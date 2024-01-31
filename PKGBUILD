# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=authpass-bin
pkgver=1.9.10
_subver=1994
pkgrel=1
pkgdesc='Password Manager based on Flutter for all platforms. Keepass 2.x (kdbx 3.x) compatible.'
arch=('x86_64')
url="https://authpass.app/"
_ghurl="https://github.com/authpass/authpass"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libsecret'
    'libkeybinder3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}_${_subver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('b4645eea43467dcafc5889b61d6e948ef3730d076de20c036a90298365e54fcb'
            '87aad073913a72e5fa1c7f4e0f6f695dafc5ba8ea675a62be03c532c701c243a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|/opt/${pkgname%-bin}/icon.svg|${pkgname%-bin}|g;s|Network|Network;Utility|g" \
      -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm0644 "${srcdir}/opt/${pkgname%-bin}/icon.svg" "${pkgdir}/usr/share/hicolor/scalable/apps/${pkgname%-bin}"
}