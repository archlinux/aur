# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blueknight-bin
_pkgname=BlueKnight
pkgver=1.2.0
_electronversion=28
pkgrel=1
pkgdesc="A Minecraft Launcher made with electron, that uses the Modrinth api to make installing mods as easy as possible.Beta version."
arch=('x86_64')
url="https://github.com/KartoffelChipss/blueknight"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}-beta/${pkgname%-bin}-launcher-deb-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('7d127710c96e9f8514d4dbabac0357bb495817513fce3d68f800043f4fb7e4dd'
            '24c1c5b90cba47cd3d7a3ff11a934fcdbb499f8c56423d22009ef33a775e2d21')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g;s|Utility|Game|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}