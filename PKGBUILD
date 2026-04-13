# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlui-native-bin
pkgver=1.68.4
_electronversion=41
pkgrel=1
pkgdesc="A simple UI client for most SQL Engines,supports most dialects of RMBDs and has limited supports for Cassandra,MongoDB,Redis,CockroachDB,Azure CosmosDB and Azure Storage Tab.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://synle.github.io/sqlui-native/"
_ghurl="https://github.com/synle/sqlui-native"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/synle/sqlui-native/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('d9107ef57d32ad8cb37802de479adb3d6df99e626f30bd9108cc66f97f8922e3'
            'a73494126f54d27c6155eecb8504842414b50317f84986eb1439fee7bb326099'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${pkgname%-bin}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
