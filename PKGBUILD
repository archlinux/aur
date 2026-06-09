# Maintainer: IAP-IT <info at iap-it dot de>
pkgname=franzfon-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="FRANZFON VoIP Softphone (prebuilt binary from vendor)"
arch=('x86_64')
url="https://franzfon.de"
license=('MIT' 'custom')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
  'alsa-lib'
)
optdepends=(
  'libayatana-appindicator: system tray icon support'
)
options=('!strip' '!emptydirs')
source=("FRANZFON-${pkgver}-amd64.deb::${url}/updates/linux/FRANZFON-${pkgver}-amd64.deb")
sha512sums=('cf7bb80c7d2b8168fd63a81fd3e38afb10911fe29fcdf490628e59a423e9c5eb839fa5b589dc24a55dc1064c10065dbeaa7278822a3e1bd118a9172b5a804ec1')

package() {
  cd "$srcdir"

  # Extract Debian package: ar archive containing control.tar.*, data.tar.*, debian-binary.
  bsdtar -xf "FRANZFON-${pkgver}-amd64.deb"

  # Extract payload directly into $pkgdir (data.tar.* extension varies — gz/xz/zst).
  bsdtar -xf data.tar.* -C "$pkgdir/"

  # Symlink CLI launcher (replaces the deb postinst's update-alternatives logic).
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/FRANZFON/franzfon" "$pkgdir/usr/bin/franzfon"

  # Electron sandbox needs SUID root (replaces deb postinst chmod 4755 chrome-sandbox).
  chmod 4755 "$pkgdir/opt/FRANZFON/chrome-sandbox"

  # Move icon from electron-builder's nonsensical "0x0" sized folder to the correct hicolor bucket.
  install -Dm644 \
    "$pkgdir/usr/share/icons/hicolor/0x0/apps/franzfon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/franzfon.png"
  rm -rf "$pkgdir/usr/share/icons/hicolor/0x0"

  # License files bundled by electron-builder live under /opt — keep them where Arch looks.
  install -Dm644 "$pkgdir/opt/FRANZFON/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "$pkgdir/opt/FRANZFON/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
