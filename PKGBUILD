# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Core_UK <mail.coreuk@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
pkgname=apple-music-electron-bin
_pkgname="Apple Music"
pkgver=3.1.1
_electronversion=19
pkgrel=5
pkgdesc="A free, lightweight, open source alternative to iTunes and other Apple Music applications based on Electron 15"
arch=('x86_64')
url="https://github.com/Alex313031/Apple-Music-Electron"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'java-runtime'
    'lib32-glibc'
    'lib32-alsa-lib'
    'portaudio'
    'alsa-lib'
)
optdepends=(
    'libnotify: Playback notifications'
    'otf-san-francisco: Use of SF Font for certain themes'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Alex313031/Apple-Music-Electron/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('7bf6157f871af6f3dee522ffbdb846c88689c2c87a542bdbe12898e1dfd280b8'
            '0fd63c3d94a7db5724728de22068188d45aa0c6be04c6e4c4c5983b5d46d5eee'
            '68521cf799a902fb3c86aa1ebdcfa92566ee49621b0e1db5873a0501d893b2e6')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,regedit} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 144x144 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}