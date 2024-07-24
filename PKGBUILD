# Creator: Liberty Raptor <libertyraptor at protonmail dot com>
# Maintainer: Liberty Raptor <libertyraptor@protonmail.com>

pkgname=xemu-bin
pkgver=0.7.122
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
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/xemu-project/xemu/releases/download/v0.7.122/xemu-v0.7.122-x86_64.AppImage")
sha256sums=('09b8b5e52f91fd6dd5d7c73265e45bb616391fa4b6b3478b8debe03127d17cb7')

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
  echo "#!/usr/bin/env bash
  cd /opt/${pkgname%-bin}
  ./AppRun \"\$@\"" > ${pkgname%-bin}.sh
  install -Dm755 ${pkgname%-bin}.sh "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
