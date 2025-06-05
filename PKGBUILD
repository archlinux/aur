# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lzmusic-bin
_pkgname='LZ Music'
pkgver=1.0.6_beta
_electronversion=25
pkgrel=1
pkgdesc="Bilibili API-based music player.(Prebuilt version.Use system-wide electron)基于 Bilibili API 的音乐播放器 "
arch=('x86_64')
url="https://lzmusic.nanhaiblog.top/"
_ghurl="https://github.com/yan5236/lzmusic"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgver//_/-}/${_pkgname// /-}-${pkgver//_/-}-linux.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('2c735ac5d89490654d0cb88d9d971cd597c724ec00ed9d5f733d770d896956cc'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "s/const dataDir = path.dirname(dbPath);/const dataDir = path.join(process.env.XDG_CONFIG_HOME, '${pkgname%-bin}', 'data');/g" "${srcdir}/app.asar.unpacked/main.js"
    sed -i "/process.cwd/d" "${srcdir}/app.asar.unpacked/main.js"
    sed -i "/if (!dbPath) {/a\\
        const configHome = process.env.XDG_CONFIG_HOME || (process.env.HOME ? path.join(process.env.HOME, '.config') : null);\\n\
        dbPath = path.join(configHome, '${pkgname%-bin}', 'data', 'history.db');\ " \
    "${srcdir}/app.asar.unpacked/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/720x720/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}