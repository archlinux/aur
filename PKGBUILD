# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ecency-surfer-appimage
pkgver=3.0.32
pkgrel=1
pkgdesc="Immutable, decentralized, uncensored, rewarding communities built, owned and operated by its users"
arch=('x86_64')
url="https://ecency.com/"
_githuburl="https://github.com/ecency/ecency-vision"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/Ecency-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/ecency/ecency-vision/development/LICENSE")
sha256sums=('c9ca4609154f05e4d94dd19b03a5967cbb37391f79bd4fe2ec640e1bb0687786'
            '4f2d94ac09ba20ec3861cf9fbb2b52ee17592b64b6fb812f04d7b71417da494d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}