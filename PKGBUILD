# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3playx-bin
_pkgname=R3PLAYX
pkgver=2.7.6
_electronversion=28
pkgrel=1
pkgdesc="A music player forked from YesPlayMusic.(Prebuilt version.Use system-wide electron)高颜值的第三方网易云播放器"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Sherlockouo/music"
license=('AGPL-3.0-only')
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%x-bin}"
    "yesplaymusic"
    "my-yesplaymusic"
)
provides=("yesplaymusic")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('ed43de2ea575edcb4a9e97825437d00870cde94bd576b14aeff316bcabc422c5')
sha256sums_x86_64=('2a2d4c1c4cebe648e5c483f86ff39f2048811ae0ba1d42ebd82a165c7de150e7')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/desktop" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/desktop/${pkgname%-bin}/g
        s/Icon=desktop/Icon=${pkgname%-bin}/g
        s/Categories=Music;/Categories=AudioVideo;/g
    " "${srcdir}/usr/share/applications/desktop.desktop"
    find "${srcdir}/opt/${_pkgname}/resources" -type d -exec chmod 755 {} +
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "s/..\/resources\/bin\/better_sqlite3.node/\/usr\/lib\/${pkgname%-bin}\/bin\/better_sqlite3.node/g" "${srcdir}/app.asar.unpacked/main/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/resources/bin/better_sqlite3.node" -t "${pkgdir}/usr/lib/${pkgname%-bin}/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/desktop.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
