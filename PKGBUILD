# Creator: Liberty Raptor <libertyraptor at protonmail dot com>
# Maintainer: Liberty Raptor <libertyraptor@protonmail.com>

pkgname=xemu-bin
pkgver=0.8.67
pkgrel=1
pkgdesc="Original Xbox Emulator"
arch=('x86_64')
url='https://xemu.app/'
license=('GPLv2')
provides=('xemu' 'xemu-bin')
conflicts=('xemu' 'xemu-git')
options=('!strip')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/xemu-project/xemu/releases/download/v0.8.67/xemu-v0.8.67-x86_64.AppImage")
sha256sums=('2f49d5f41e5f6e7c1e30781b2f009f3039a883bed6bb49978733c9ffd3d1ba9c')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/${pkgname%-bin}.svg "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.svg"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "xemu" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Game;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
