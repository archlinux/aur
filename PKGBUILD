# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=podman-desktop-companion-bin
_pkgname="Podman Desktop Companion"
pkgver=5.2.0_rc.1
_electronversion=31
pkgrel=1
pkgdesc="Cross-platform desktop integrated application with consistent UI,Learning tool for the powerful podman command line interface"
arch=("x86_64")
url="https://iongion.github.io/podman-desktop-companion/"
_ghurl="https://github.com/iongion/podman-desktop-companion"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'podman'
    'docker'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-amd64-${pkgver//_/-}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/iongion/podman-desktop-companion/${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0f6ab3f8f1b5969c3223bdeb1c6d81601c715181ce21dc56f29f3b67c2da0c3c'
            '1a33f39c0fb06d0bf3bc82dbb2ca621ebd225158dd9a73557f7f583a9d61ece6'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}