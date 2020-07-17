# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=deepnest-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='An open source nesting application, great for laser cutters, plasma cutters, and other CNC machines'
arch=('x86_64')
url='https://deepnest.io'
license=('custom:unknown')
depends=('pango-legacy')
provides=('deepnest')
source=("${pkgname%-bin}-${pkgver}.zip::https://deepnest.io/Deepnest-${pkgver}-linux.zip")
sha256sums=('54c049da97acc39741a4c960833258b0b2f9772dbdffdc1a27370983a8657a51')

package() {
  cd Deepnest-${pkgver}-linux/
  chmod 755 ./Deepnest-${pkgver}-x86_64.AppImage
  ./Deepnest-${pkgver}-x86_64.AppImage --appimage-extract
  echo "#!/usr/bin/env bash
  LD_LIBRARY_PATH=/opt/pango-legacy/usr/lib /opt/deepnest/AppRun" > deepnest
  install -Dm755 deepnest -t "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/deepnest.png -t "${pkgdir}/usr/share/pixmaps"
  sed -i "4s|AppRun|deepnest|" squashfs-root/deepnest.desktop
  install -Dm644 squashfs-root/deepnest.desktop -t "${pkgdir}/usr/share/applications"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/${pkgname%-bin}/usr/share/icons" -type f -exec chmod 644 {} +
}
# vim:set ts=2 sw=2 et: