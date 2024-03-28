# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=p3x-redis-ui-bin
_appname=P3X-Redis-UI
pkgver=2024.4.186
_electronversion=29
pkgrel=1
pkgdesc="A very functional handy database GUI and works in your pocket on the responsive web or as a desktop app"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://www.corifeus.com/redis-ui"
_ghurl="https://github.com/patrikx3/redis-ui"
license=("MIT")
conflicts=("${pkgname%-bin}=${pkgver}")
providers=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/patrikx3/redis-ui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1847e0e0698142ed4347c1441a9fa81c8fbddd44b1d8bbcd5e3647f991759d7f'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('8911a6b012739bf3b39b367999a1c429a1385bfa85eab87f17b331c290ec1348')
sha256sums_armv7h=('f6aa01977f5802ef58d41d6c405276818585ac55927a6bb00eb1557bc4e355a3')
sha256sums_x86_64=('a4a4635ad4e124285396213f54fdb7f0d38d7cbeee9baf485c6a578785147feb')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_appname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}