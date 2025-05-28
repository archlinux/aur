# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=space-client-bin
_pkgname='Space Client'
pkgver=2.0.7
_electronversion=30
pkgrel=1
pkgdesc="Customized Minecraft launcher modified and written in electron.js and Node.js.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://xtony.net/"
_ghurl="https://github.com/xtonysanx/Space-Client"
license=('CC-BY-NC-SA-4.0')
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
    "${pkgname%-bin}-${pkgver}-${CARCH}.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname// /-}-linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/xtonysanx/Space-Client/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('143ff74cb2e586b9c273533f5dd0f2ec19a3b4d8d49219ce74d4117a865ad7c3'
            'f3ced4e15f937db13d8a08686a485cddacd8ab21f4ce05de9569b1211feb3a25'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
    rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/"{mac,linux/{arm*,ia32}}
    ln -sf "/usr/bin/7za" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}