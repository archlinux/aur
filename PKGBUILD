# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>
pkgname=motrix-appimage
pkgver=1.8.19
pkgrel=2
pkgdesc="A full-featured download manager,Support downloading HTTP, FTP, BitTorrent, Magnet, etc."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://motrix.app/"
_githuburl="https://github.com/agalwood/Motrix"
license=('MIT')
options=('!strip')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/Motrix-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/Motrix-${pkgver}-armv7l.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/Motrix-${pkgver}.AppImage")
source=("https://raw.githubusercontent.com/agalwood/Motrix/master/LICENSE")
sha256sums=('f60775e705e2c7418665ac2c7f386d28cc2927df98a440ced1703a7ed3ca86b7')
sha256sums_aarch64=('719362d60d6e7ac1204cab2261338476ee9bb28fcf334d02918fe76ed5848285')
sha256sums_armv7h=('6093c0207e5701b1979361eec89f7ce2da887ef0df691d4ec421ef8835d9ef93')
sha256sums_x86_64=('a123be547ddb65c8e75e3102a9980e9acbe538e35b7e03aae74a952ef1dd29fa')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-appimage}.xml" -t "${pkgdir}/usr/share/mime"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}