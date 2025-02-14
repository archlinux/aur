# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wp-downloader-electron-bin
_pkgname='WP-Downloader Electron'
pkgver=1.0.1
_electronversion=33
pkgrel=2
pkgdesc="Wattpad Downloader (A website to download wp stories) -> Wrapped in Electron.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://wpdl.us/desktop"
_ghurl="https://github.com/sipsuru/wp-downloader-electron"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/sipsuru/wp-downloader-electron/${pkgver}/LICENSE.md"
    "LICENSE-ORIGINAL-${pkgver}.md::https://raw.githubusercontent.com/sipsuru/wp-downloader-electron/${pkgver}/ORIGINAL-LICESE.md"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.x86_64.rpm")
sha256sums=('f518e3c019c0c961bb7e30889a7a380706829b796d696864d144cea285c5439a'
            '6569e851f36dbfc2ca03c369e4722582eed9affa09d6af1b76ec3db148219a2a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('f419a7c3a9fcae0ed0ed57f3de5e0b1748f37ed840f2c36546fd2aaadfc1553a')
sha256sums_armv7h=('f0d5148855ed954adf394875a1f2bf13e5cf73195a81644dca328ee73b18fd8f')
sha256sums_x86_64=('4aeabbad148052ff2b1a1b350d9af050a52510fe406436821c2401e6b636e076')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked"  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/LICENSE-ORIGINAL-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ORIGINAL.md"
}