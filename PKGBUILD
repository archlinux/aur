# Maintainer: Keiran <keircn@proton.me>

pkgname=pince-bin
pkgver=0.4.5
pkgrel=3
pkgdesc="Reverse engineering tool for linux games - front-end/reverse engineering tool for GDB"
arch=('x86_64')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('fuse2' 'hicolor-icon-theme' 'zenity')
provides=('pince')
conflicts=('pince' 'pince-git')
options=('!strip')
source=("PINCE-x86_64-${pkgver}.AppImage::https://github.com/korcankaraokcu/PINCE/releases/download/v${pkgver}/PINCE-x86_64.AppImage"
  "pince.desktop")
sha256sums=('16edf97d9dc94ea35a39c0c50fb1de8e42be2f969f650f93d0eea0b775e0f1f7'
  'abe47d7c25930a19beab323430be9db63cda5940233da3436c25f3f9e20b7098')
noextract=("PINCE-x86_64-${pkgver}.AppImage")

prepare() {
  chmod +x "${srcdir}/PINCE-x86_64-${pkgver}.AppImage"
  "${srcdir}/PINCE-x86_64-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/PINCE-x86_64-${pkgver}.AppImage" "${pkgdir}/opt/pince/PINCE.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/pince" <<'EOF'
#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    export SUDO_ASKPASS="/usr/bin/pince-askpass"
    exec sudo -A -E /opt/pince/PINCE.AppImage "$@"
else
    exec /opt/pince/PINCE.AppImage "$@"
fi
EOF
  chmod 755 "${pkgdir}/usr/bin/pince"

  cat >"${pkgdir}/usr/bin/pince-askpass" <<'EOF'
#!/bin/bash
zenity --password --title="PINCE" --text="PINCE requires root privileges"
EOF
  chmod 755 "${pkgdir}/usr/bin/pince-askpass"
  install -Dm644 "${srcdir}/pince.desktop" "${pkgdir}/usr/share/applications/pince.desktop"
  install -Dm644 "${srcdir}/squashfs-root/PINCE.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pince.svg"
}
