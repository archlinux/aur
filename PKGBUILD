# PKGBUILD
pkgname=opencode-ui-bin
pkgver=0.1.6
pkgrel=2
pkgdesc="OpenCode Desktop Client"
arch=('x86_64')
url="https://github.com/marmotz-dev/opencode-ui"
license=('CC-BY-NC-SA-4.0')
depends=('opencode-bin')
source=(
  "https://github.com/marmotz-dev/opencode-ui/releases/download/v${pkgver}/opencode-ui-${pkgver}.AppImage"
)
sha256sums=(
  '2f6b30d3a566a1732bdef06ecc3be851986f3aa3e5606bfd99c147792f55a84c'
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