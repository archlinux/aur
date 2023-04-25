# Contributor: rsteube <rsteube@users.noreply.github.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alva-appimage
_appname=Alva
pkgver=0.9.1
pkgrel=1
pkgdesc="Create living prototypes with code components."
arch=('x86_64')
url="https://meetalva.io/"
_githuburl="https://github.com/meetalva/alva"
license=('MIT')
provides=()
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
  "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('da5d279034825e48538273412f66016e35178684c59f3b11aa03e93a6f700c0d'
            'c69d22024d1f29a64a050718f5b1f2af7647cb0ef99136fb5a7f9647caf1e246')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/alva.AppImage|g;s|Icon=Alva|Icon=alva|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}  
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
  done
}