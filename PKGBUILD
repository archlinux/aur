# Creator: Liberty Raptor <libertyraptor at protonmail dot com>
# Maintainer: Liberty Raptor <libertyraptor@protonmail.com>

pkgname=xemu-bin
pkgver=0.8.35
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
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/xemu-project/xemu/releases/download/v0.8.35/xemu-v0.8.35-x86_64.AppImage")
sha256sums=('e8232674517030b0262d8fa96c3aee415f12e4992517af0b5e73ecf8fdd69bdc')

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
