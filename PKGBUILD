# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from DeepSeek V4 Flash.

pkgname=coros-link-appimage
pkgver=0.1.30
pkgrel=1
pkgdesc="Unofficial COROS watch companion — media sync, offline maps, route builder, and training analytics (AppImage)"
arch=('x86_64')
url="https://coros-link.vercel.app/"
license=('MIT')
depends=('fuse2')
makedepends=('squashfs-tools')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/JunAkerBuilds/CorosLink/releases/download/v${pkgver}/CorosLink-${pkgver}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/JunAkerBuilds/CorosLink/main/LICENSE")
sha256sums=('121b30876a5a6dd7b8016ebd24d4d9666eecd616ba58b91472efb09dfe0f6b86'
            '852251d268287b43ae09daa3cb5ece6ccb6cb03245da1ec7ad23d7054dc1a8da')

prepare() {
  cp -L "${srcdir}/${pkgname}-${pkgver}.AppImage" "${srcdir}/real-appimage"
  chmod +x "${srcdir}/real-appimage"
  "${srcdir}/real-appimage" --appimage-extract >/dev/null 2>&1
}

package() {
  local _src="${srcdir}/real-appimage"
  mkdir -p "${pkgdir}/usr/bin"
  cat "${_src}" > "${pkgdir}/usr/bin/coros-link"
  chmod 755 "${pkgdir}/usr/bin/coros-link"

  cd "${srcdir}/squashfs-root"
  install -Dm644 "coroslink.desktop" "${pkgdir}/usr/share/applications/coros-link.desktop"
  sed -i 's|Exec=AppRun|Exec=coros-link|' "${pkgdir}/usr/share/applications/coros-link.desktop"

  install -Dm644 "coroslink.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/coros-link.png"
  install -Dm644 "coroslink.png" "${pkgdir}/usr/share/pixmaps/coros-link.png"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
