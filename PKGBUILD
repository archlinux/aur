# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=selvania-launcher-bin
_pkgname=Selvania-Launcher
pkgver=2.1.0
_electronversion=36
pkgrel=1
pkgdesc="Custom launcher for modded minecraft written in electron.js and Node.js.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="http://luuxis.fr/"
_ghurl="https://github.com/luuxis/Selvania-Launcher"
license=("CC-BY-ND-4.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    '7zip'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}-${CARCH}.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/luuxis/Selvania-Launcher/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('2079978f4c4a511b31a209c2db8d54b561a2b8b06bbf469cf51dae3f7d9ddaca'
            '7c73b8f626696c0403394da3dae0d5ed33009cc2d674803d40bc4e2c7e67174b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/"{mac,linux/{arm*,ia32}}
    ln -sf "/usr/bin/7za" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}