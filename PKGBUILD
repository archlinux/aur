# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=liketaskmanager-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="A Qt based, self-contained (AppImage) process monitor that mimics the feel and functionality of Windows 10 Task Manager's performance and process tab under Linux"
arch=('x86_64')
url='https://github.com/rejuce/LikeTaskManager'
license=('GPL3')
provides=('liketaskmanager')
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/rejuce/LikeTaskManager/releases/download/${pkgver}/LikeTaskManager-x86_64.AppImage")
sha256sums=('7e217a63c4bbf71f49a04ebe77dea8a6b2ed5d990341bff7212c8f2662aea20d')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Like Task Manager" \
          --comment "$pkgdesc" \
          --exec ltm \
          --categories 'Utility;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/ltm"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/${pkgname%-bin}" -type f -exec chmod o-w {} +
}