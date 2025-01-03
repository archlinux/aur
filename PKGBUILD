# Creator: Liberty Raptor <libertyraptor at protonmail dot com>
# Maintainer: Liberty Raptor <libertyraptor@protonmail.com>

pkgname=flycast-bin
pkgver=2.3
pkgrel=1
pkgdesc="Sega Dreamcast, NAOMI, NAOMI 2, Atomiswave and System SP Emulator"
arch=('x86_64')
url='https://github.com/flyinghead/flycast'
license=('GPLv2')
provides=('flycast' 'flycast-stable-bin')
conflicts=('flycast' 'flycast-git' 'flycast-bin')
options=('!strip')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/flyinghead/flycast/releases/download/v2.3/flycast-x86_64.AppImage")
sha256sums=('f1d56d9d4873e1c70ed83556ac7dd0bedf6c88823e92db712954dba7deb3af99')

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
  ./AppRun \"\$@\"" > ${pkgname%-bin}.sh
  install -Dm755 ${pkgname%-bin}.sh "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
