# Creator: Liberty Raptor <libertyraptor at protonmail dot com>
# Maintainer: Liberty Raptor <libertyraptor@protonmail.com>

pkgname=flycast-bin
pkgver=2.1
pkgrel=1
pkgdesc="Sega Dreamcast, NAOMI, NAOMI 2 and Atomiswave Emulator"
arch=('x86_64')
url='https://github.com/flyinghead/flycast'
license=('GPLv2')
provides=('flycast' 'flycast-stable-bin')
conflicts=('flycast' 'flycast-git' 'flycast-bin')
options=('!strip')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/flyinghead/flycast/releases/download/V2.1/flycast-x86_64.AppImage")
sha256sums=('582184502f4f627528b959262a239c821c4e43280eeba13e9f08b6a4e489340e')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/${pkgname%-bin}.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Flycast" \
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
