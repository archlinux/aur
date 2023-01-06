# Creator: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Artem Vasilev <artem.vasilev@rwth-aachen.de>

pkgname=duckstation-qt-bin
pkgver=latest
pkgrel=1
pkgdesc="Fast PlayStation 1 emulator for PC and Android"
arch=('x86_64')
url='https://github.com/stenzek/duckstation'
license=('GPL3')
provides=('duckstation-qt' 'duckstation')
options=('!strip')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage")
sha256sums=('SKIP')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/${pkgname%-bin}.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "DuckStation-Qt" \
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
  ./AppRun" > ${pkgname%-bin}.sh
  install -Dm755 ${pkgname%-bin}.sh "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
