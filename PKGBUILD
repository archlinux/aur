# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ldtk-appimage
_pkgname=LDtk
pkgver=1.5.3
pkgrel=2
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://ldtk.io/"
_ghurl="https://github.com/deepnight/ldtk"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
  'hicolor-icon-theme'
  'glibc'
  'zlib'
)
makedepends=(
  'squashfuse'
)
options=("!strip")
_install_path="/opt/appimages"
source=(
  "${pkgname%-appimage}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/ubuntu-distribution.zip"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/deepnight/ldtk/v${pkgver}/LICENSE"
)
sha256sums=('8bb1c870ab35d2cadfbf08a119d3049e7986a2a80558d2610babc67fcd502566'
            'f409a37a40e823efefddac3140d991141633d4db3cec4f8667bc23b846dcc335')
build() {
  mv "${srcdir}/${_pkgname} ${pkgver} installer.AppImage" "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
  chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
  "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
  sed "s|AppRun|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm755 -d "${pkgdir}/usr/bin"
  ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
  for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
      -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
  done
  install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-appimage}.xml" -t "${pkgdir}/usr/share/mime"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}