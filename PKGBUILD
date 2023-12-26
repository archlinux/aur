# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=nexus_wallet
pkgname="${_pkgname//_/-}-appimage"
pkgver=3.1.1
pkgrel=1
pkgdesc="The official Logical and Interface layers of the Nexus Software Stack."
arch=('x86_64')
url="https://crypto.nexus.io/wallet"
_ghurl="https://github.com/Nexusoft/NexusInterface"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Nexusoft/NexusInterface/v${pkgver}/LICENSE"
)
sha256sums=('9886ea53dde1202ef3d40cd64901df6f72c32bc09a379b2986a23e37a08a684f'
            'e7ee68282295100c6be4565152cb535d43086d2354760a8f006f1e980e0a3bb5')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g;s|P2P|Network|g;s|${_pkgname}|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}