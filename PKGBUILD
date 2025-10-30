# PKGBUILD
pkgname=opencode-ui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="OpenCode Desktop Client"
arch=('x86_64')
url="https://github.com/marmotz-dev/opencode-ui"
license=('CC-BY-NC-SA-4.0')
depends=('opencode-bin')
source=(
  "https://github.com/marmotz-dev/opencode-ui/releases/download/v${pkgver}/opencode-ui-${pkgver}.AppImage"
)
sha256sums=(
  'dbab843227b1f53d3d5dcab3d82a69bc7cfaf050d554f9981633a652c85867dd'
)

package() {
  chmod +x ./opencode-ui-${pkgver}.AppImage
  ./opencode-ui-${pkgver}.AppImage --appimage-extract
  install -dm755 "${pkgdir}/opt/opencode-ui"
  cp -r squashfs-root/* "${pkgdir}/opt/opencode-ui/"
  find "${pkgdir}/opt/opencode-ui/locales" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/opencode-ui/locales" -type f -exec chmod 644 {} \;
  find "${pkgdir}/opt/opencode-ui/resources" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/opencode-ui/resources" -type f -exec chmod 644 {} \;
  find "${pkgdir}/opt/opencode-ui/usr" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/opencode-ui/usr" -type f -exec chmod 644 {} \;

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/opencode-ui/AppRun "${pkgdir}/usr/bin/opencode-ui"

  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/opencode-ui.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/opencode-ui.png"
  install -Dm644 squashfs-root/opencode-ui.desktop "${pkgdir}/usr/share/applications/opencode-ui.desktop"
  sed -i 's/Exec=.*/Exec=opencode-ui %U/' "${pkgdir}/usr/share/applications/opencode-ui.desktop"
}