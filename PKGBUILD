# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="visualfamilytree-appimage"
_appname="visual-family-tree"
pkgver=1.4.0
pkgrel=1
pkgdesc="Create a family tree with extensive information and pictures about the individual family members."
arch=('x86_64')
url="https://visualfamilytree.jisco.me"
_githuburl="https://github.com/Jisco/VisualFamilyTree"
license=('custom:freeware')
options=(!strip)
providers=(Jisco)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/VisualFamilyTree.${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/README.md")
sha256sums=('a087fe43ab9b77db2dbbd10e4172e07f6689916a53eac606120897f858cbb70c'
            '1e28e02b99e91ce1bf896f3c6694dc1475feea02318d69b371181c1fb8b69d97')
_install_path="/opt/appimages"
  
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/visualfamilytree.AppImage|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}