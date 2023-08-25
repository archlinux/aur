# Creator: Liberty Raptor <libertyraptor at protonmail dot com>
# Maintainer: Liberty Raptor <libertyraptor@protonmail.com>

pkgname=xemu-bin
pkgver=0.7.107
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
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/xemu-project/xemu/releases/download/v0.7.107/xemu-v0.7.107-x86_64.AppImage")
sha256sums=('b51050971f9745e2b831a8e3e9bdfb91b127f47e41208f7d77eb6e88c9590fdc')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/${pkgname%-bin}.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
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
  echo "#!/usr/bin/env bash
  cd /opt/${pkgname%-bin}
  ./AppRun \"\$@\"" > ${pkgname%-bin}.sh
  install -Dm755 ${pkgname%-bin}.sh "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
