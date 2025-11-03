# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bar-lobby-bin
_pkgname=BeyondAllReason
pkgver=0.15.2
_electronversion=37
pkgrel=1
pkgdesc="a new WIP lobby for the RTS game Beyond All Reason.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://beyond-all-reason.github.io/bar-lobby/"
_ghurl="https://github.com/beyond-all-reason/bar-lobby"
license=(
    'MIT'
    'CC-BY-NC-ND-4.0'
    'CC-BY-3.0'
    'CC-BY-SA-3.0'
    'CC0-1.0'
    'ISC'
    'OFL-1.0'
    'Unlicense'
    'LicenseRef-custom'
)
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
    "${pkgname%-bin}-${pkgver}-${CARCH}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-CC-BY-3.0-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/CC-BY-3.0.txt"
    "LICENSE-CC-BY-NC-ND-4.0-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/CC-BY-NC-ND-4.0.txt"
    "LICENSE-CC-BY-SA-3.0-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/CC-BY-SA-3.0.txt"
    "LICENSE-CC0-1.0-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/CC0-1.0.txt"
    "LICENSE-ISC-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/ISC.txt"
    "LicenseRef-IFOPE-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/LicenseRef-IFOPE.txt"
    "LicenseRef-UNKNOWN-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/LicenseRef-UNKNOWN.txt"
    "LICENSE-MIT-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/MIT.txt"
    "LICENSE-OFL-1.1-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/OFL-1.1.txt"
    "Unlicense-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/Unlicense.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('a230b8a29a0cb82c75fac5d1e22cb56077e040dfeb51aa06e5f978b43597e5c7'
            'e6bc9e9c474700b708f568bac9e5a8a9bcb2b1dad53442f5ba449fcb848b8e76'
            '4f3c4a321eb0c73182eee7afa3fe0111e24dec193f2d6febcf4207f26af26839'
            '3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499'
            'f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9'
            '259e4782bab664d1842d36f2bd642748357a53187617664bb01dcda9ee500b91'
            '5c9198cbb9b1a1579acdf3742284e65db9ab5abcff83b802d5da6923d0f4c3d5'
            'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5'
            '8eea8287e5876b539670cadb82e99f9a7afddec6f6730811be1daf25d2e9bcfd'
            '0bdebfeda07d45dada625ae1317c6f833186e798b171d0db640bcf32e92a8240'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
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
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} +
    rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/"{mac,linux/{arm*,ia32}}
    ln -sf "/usr/bin/7za" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-CC-BY-3.0-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-3.0.txt"
    install -Dm644 "${srcdir}/LICENSE-CC-BY-NC-ND-4.0-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-NC-ND-4.0.txt"
    install -Dm644 "${srcdir}/LICENSE-CC-BY-SA-3.0-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-SA-3.0.txt"
    install -Dm644 "${srcdir}/LICENSE-CC0-1.0-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC0-1.0.txt"
    install -Dm644 "${srcdir}/LICENSE-ISC-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ISC.txt"
    install -Dm644 "${srcdir}/LicenseRef-IFOPE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LicenseRef-IFOPE.txt"
    install -Dm644 "${srcdir}/LicenseRef-UNKNOWN-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LicenseRef-UNKNOWN.txt"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT.txt"
    install -Dm644 "${srcdir}/LICENSE-OFL-1.1-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-OFL-1.1.txt"
    install -Dm644 "${srcdir}/Unlicense-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Unlicense.txt"
}
