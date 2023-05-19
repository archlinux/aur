# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="batch-explorer-appimage"
pkgver=2.17.0stable.801
_appver=2.17.0-stable.801
pkgrel=1
pkgdesc="A client tool to help create, debug and monitor Azure Batch Applications"
arch=("x86_64")
url="https://azure.github.io/BatchExplorer/"
_githuburl="https://github.com/Azure/BatchExplorer"
license=('MIT')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-patterns")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${_appver}/BatchExplorer-${_appver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Azure/BatchExplorer/main/LICENSE")
sha256sums=('42a50088a2d7a4db1cf2779e985e9b0c25d678910ce1f4ae2a83e6cfee19e4a6'
            '0b9ebab8a849f3ae8ed5bd7a35022bff9dce901efeeb53e855e91c02c8500ab0')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/batch-explorer.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}