# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Core_UK <mail.coreuk@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
pkgname=apple-music-electron-bin
_pkgname="Apple Music"
pkgver=3.1.1
pkgrel=3
pkgdesc="A free, lightweight, open source alternative to iTunes and other Apple Music applications based on Electron 15"
arch=('x86_64')
url="https://github.com/Alex313031/Apple-Music-Electron"
license=("MIT")
depends=('bash' 'electron15' 'hicolor-icon-theme')
optdepends=('libnotify: Playback notifications'
            'otf-san-francisco: Use of SF Font for certain themes')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/Apple-Music-Electron/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('7bf6157f871af6f3dee522ffbdb846c88689c2c87a542bdbe12898e1dfd280b8'
            '0fd63c3d94a7db5724728de22068188d45aa0c6be04c6e4c4c5983b5d46d5eee'
            '44dc6173c7bb88874ac68a31aaacc0bfb422a8fcd218d54cc124ebf36a5c5e72')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/regedit" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 144x144 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}