# Creator: Liberty Raptor <libertyraptor at protonmail dot com>
# Maintainer: Liberty Raptor <libertyraptor@protonmail.com>

pkgname=flycast-stable-bin
pkgver=2.3
pkgrel=1
pkgdesc="Fycast Dreamcast Emulator"
arch=('x86_64')
url='https://github.com/flyinghead/flycast'
license=('GPLv2')
provides=('flycast' 'flycast-stable-bin')
conflicts=('flycast' 'flycast-git' 'flycast-bin')
options=('!strip')
makedepends=('gendesk')
noextract=("${pkgname%-stable-bin}-${pkgver}.AppImage")
source=("${pkgname%-stable-bin}-${pkgver}.AppImage::https://github.com/flyinghead/flycast/releases/download/v2.3/flycast-x86_64.AppImage")
sha256sums=('f1d56d9d4873e1c70ed83556ac7dd0bedf6c88823e92db712954dba7deb3af99')

package() {
  chmod 755 ./${pkgname%-stable-bin}-${pkgver}.AppImage
  ./${pkgname%-stable-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/${pkgname%-stable-bin}.png "${pkgdir}/usr/share/pixmaps/${pkgname%-stable-bin}.png"
  gendesk -f -n --pkgname "${pkgname%-stable-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "flycast" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-stable-bin}" \
          --categories 'Utility;Game;Application' \
          --icon "${pkgname%-stable-bin}"
  install -Dm644 "${pkgname%-stable-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-stable-bin}"
  echo "#!/usr/bin/env bash
  cd /opt/${pkgname%-stable-bin}
  ./AppRun \"\$@\"" > ${pkgname%-stable-bin}.sh
  install -Dm755 ${pkgname%-stable-bin}.sh "${pkgdir}/usr/bin/${pkgname%-stable-bin}"
  find "${pkgdir}/opt/${pkgname%-stable-bin}" -type d -exec chmod 755 {} +
}
