# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alger-music-bin
_pkgname=AlgerMusic
pkgver=2.4.0
_electronversion=32
pkgrel=1
pkgdesc="An music player based on Electron, TypeScript, and Vue 3.(Prebuilt version.Use system-wide electron)支持网易云音乐"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="http://mc.alger.fun/"
_ghurl="https://github.com/algerkong/AlgerMusicPlayer"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'gendesk'
    'p7zip'
)
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.exe")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/algerkong/AlgerMusicPlayer/${pkgver}/public/icon.png"
    "${pkgname%-bin}-${pkgver}-16x16.png::https://raw.githubusercontent.com/algerkong/AlgerMusicPlayer/${pkgver}/public/icon_16x16.png"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.exe::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Setup_arm64.exe")
source_i686=("${pkgname%-bin}-${pkgver}-i686.exe::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Setup_x86.exe")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.exe::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Setup_x64.exe")
sha256sums=('8ec85ca584462e6996a3d3e3641b276a5e2365b47ab799cc18f25301661756df'
            '5def34445eec5089a0d88bc06635f7be8601db2a2dcb50907a3bdd214a7844a7'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('130f32d63fb492fc85129aa071add95670c3f303a6f01cc5660836139ff869b8')
sha256sums_i686=('ab9fb695e0cfc77df5e3820e5f3861037d3587d2a524e07662451716a1441b8b')
sha256sums_x86_64=('26e061842724a15f1d3114aaafde1679ec14ca2977795280e65abbb1ae091c92')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    7z x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.exe" -aoa -o"${srcdir}"
    7z x "${srcdir}/\$PLUGINSDIR/app"*.7z -aoa -o"${srcdir}"
    asar e "${srcdir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-16x16.png" "${srcdir}/app.asar.unpacked/public/icon_16x16.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}