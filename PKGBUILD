# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chirpity-bin
_pkgname=Chirpity
pkgver=3.2.7
_electronversion=27
pkgrel=1
pkgdesc="Desktop application to identify bird vocalisations in lengthy audio files. Uses either BirdNET or a native AI model tuned for the calls of nocturnal migrants.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://chirpity.mattkirkland.co.uk/"
_ghurl="https://github.com/Mattk70/Chirpity-Electron"
license=('CC-BY-NC-SA-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/Mattk70/Chirpity-Electron/v${pkgver}/license.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('19c38d695100ea45f01deef5483d09860a6cf8cf1e7bd646f97345c9218ca057'
            '04d5c28567bb68b3c647742455c90091e2ea2b6708da27679889e1f80dd838ed'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,Help} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}