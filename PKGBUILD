# Maintainer: James King <james@jamesking.dev>
pkgname=localmail
pkgver=0.1.0
pkgrel=1
pkgdesc="Local email testing for developers"
arch=('x86_64')
url="https://localmail.dev"
license=('custom:proprietary')
depends=('fuse2' 'hicolor-icon-theme')
source=("https://download.localmail.dev/releases/v${pkgver}/LocalMail.AppImage")
sha256sums=('fba5c19adc49e78cad24595da44a5803953d463e7da92fda874ca890a3935731')

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

  if [ -f "${srcdir}/squashfs-root/resources/icon.png" ]; then
    install -Dm644 "${srcdir}/squashfs-root/resources/icon.png"       "${pkgdir}/usr/share/icons/hicolor/512x512/apps/localmail.png"
  fi
}
