# Creator: Liberty Raptor <libertyraptor at protonmail dot com>
# Maintainer: Liberty Raptor <libertyraptor@protonmail.com>

pkgname=flycast-stable-bin
pkgver=2.2
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
source=("${pkgname%-stable-bin}-${pkgver}.AppImage::https://github.com/flyinghead/flycast/releases/download/v2.2/flycast-x86_64.AppImage")
sha256sums=('954efda76428eb490c61ad85b1ed29e3dd09cb1a5771822c35bb0f80bafec56f')

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
