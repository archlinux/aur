# Maintainer: James King <james@jamesking.dev>
pkgname=localmail
pkgver=0.1.0
pkgrel=1
pkgdesc="Local email testing for developers"
arch=('x86_64')
url="https://localmail.dev"
license=('custom:proprietary')
depends=('fuse2' 'hicolor-icon-theme')
source=("https://download.localmail.dev/releases/${pkgver}/LocalMail.AppImage")
sha256sums=('717826ca064bca82089b0f0f9c07944016eae69fc0b5db723dbe2e70dab6b28c')

prepare() {
  chmod +x "${srcdir}/LocalMail.AppImage"
  "${srcdir}/LocalMail.AppImage" --appimage-extract
}

package() {
  install -d "${pkgdir}/opt/localmail"
  cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/localmail/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/localmail/localmail "${pkgdir}/usr/bin/localmail"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/localmail.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=LocalMail
Comment=Local email testing for developers
Exec=/opt/localmail/localmail %U
Icon=localmail
Type=Application
Categories=Development;
StartupWMClass=LocalMail
DESKTOP_EOF

  if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/localmail.png" ]; then
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/localmail.png"       "${pkgdir}/usr/share/icons/hicolor/512x512/apps/localmail.png"
  fi
}
