# Maintainer: Zhiqiang ZHOU <aur@strrl.dev>
pkgname=raft-desktop-bin
pkgver=1.21.24
pkgrel=1
pkgdesc='Collaborative human and AI messaging desktop app'
arch=('x86_64')
url='https://raft.build'
license=('LicenseRef-custom')
depends=('bash' 'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'libgcc' 'hicolor-icon-theme' 'systemd-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
optdepends=('nodejs: run the bundled command line tool' 'libappindicator-gtk3: system tray integration')
provides=('raft-desktop')
conflicts=('raft-desktop')
options=('!strip' '!debug')
source=("https://github.com/botiverse/desktop/releases/download/v${pkgver}/Raft-Desktop-${pkgver}-amd64.deb")
sha256sums=('d18a90eb4c22c329410542c57d69dc167a2b0a8243dd9361af80dd3b3c063d0b')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/opt/Raft Desktop" "$pkgdir/opt/raft-desktop"
  rm "$pkgdir/opt/raft-desktop/resources/app-update.yml"
  rm "$pkgdir/opt/raft-desktop/resources/package-type"
  install -dm755 "$pkgdir/usr/bin"
  ln -s '/opt/raft-desktop/@botiverseraft-desktop-electron' "$pkgdir/usr/bin/raft-desktop"

  mv "$pkgdir/usr/share/applications/@botiverseraft-desktop-electron.desktop" \
    "$pkgdir/usr/share/applications/raft-desktop.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=raft-desktop %U|' \
    -e 's|^Comment=.*|Comment=Collaborative human and AI messaging|' \
    "$pkgdir/usr/share/applications/raft-desktop.desktop"

  chmod 4755 "$pkgdir/opt/raft-desktop/chrome-sandbox"
  install -Dm644 "$pkgdir/opt/raft-desktop/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$pkgdir/opt/raft-desktop/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
