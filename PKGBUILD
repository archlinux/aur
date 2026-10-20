# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=pipette-desktop-keychron-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Pipette — Vial-compatible keyboard configurator (AppImage). Keychron fork"
arch=("x86_64")
url="https://github.com/Tymon3310/pipette-desktop"
license=('GPL-3.0-or-later')
provides=('pipette-desktop')
conflicts=('pipette-desktop-git' 'pipette-desktop-keychron-git' 'pipette-desktop-bin')
# The app binary is taken out of the release AppImage and runs on the
# system's WebKitGTK instead of the copy bundled in the AppImage.
depends=('webkit2gtk-4.1' 'libsoup3' 'gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libayatana-appindicator' 'systemd-libs' 'dbus' 'hicolor-icon-theme')
optdepends=('dfu-util: flash Keychron firmware')
options=('!strip' '!debug')
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/Tymon3310/pipette-desktop/releases/download/v${pkgver}/Pipette-linux-x86_64.AppImage")
sha256sums=('22cb23998676e735fe2eb42abf0f6a6ab313870a7822287efed668f6ab419aeb')

prepare() {
  cd "$srcdir"
  rm -rf squashfs-root
  chmod +x "./${_appimage}"
  "./${_appimage}" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir/squashfs-root"
  install -Dm755 usr/bin/pipette "$pkgdir/usr/bin/pipette-desktop"
  install -Dm644 usr/lib/Pipette/udev/99-vial.rules "$pkgdir/usr/lib/udev/rules.d/70-pipette-desktop.rules"
  install -Dm644 usr/share/icons/hicolor/1024x1024/apps/pipette.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/pipette-desktop.png"

  install -dm755 "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/pipette-desktop.desktop" <<EOF
[Desktop Entry]
Name=Pipette
Exec=pipette-desktop %U
Terminal=false
Type=Application
Icon=pipette-desktop
StartupWMClass=pipette
Comment=Vial-compatible keyboard configurator
Categories=Utility;HardwareSettings;
EOF
}
