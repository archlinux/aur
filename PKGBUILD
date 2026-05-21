# Maintainer: IAP-IT <info at iap-it dot de>
pkgname=franzfon-bin
pkgver=1.2.4
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
sha512sums=('a1bcaa39d8f28e1d08d9646521c7a73fba200fab1f4fa06b7b6ac3de560831b3a3a0c0a7f54e141005b90d3a5f1c80094be108c9a4a67585477b104e0b4fe7fc')

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
