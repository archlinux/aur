# Maintainer: submit as i2pchat-bin on AUR (see packaging/aur/README.md)
# Checksums: ./packaging/refresh-checksums.sh vX.Y.Z or sha256sum local zips after release.
pkgname=i2pchat-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Experimental peer-to-peer chat client for the I2P network (official AppImage, binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MetanoicArmor/I2PChat"
license=('AGPL-3.0-or-later')
depends=('hicolor-icon-theme' 'zlib')
options=('!strip')
_icon="icon.png::${url}/raw/v${pkgver}/icon.png"
source_x86_64=("I2PChat-linux-x86_64-v${pkgver}.zip::${url}/releases/download/v${pkgver}/I2PChat-linux-x86_64-v${pkgver}.zip"
               "${_icon}")
source_aarch64=("I2PChat-linux-aarch64-v${pkgver}.zip::${url}/releases/download/v${pkgver}/I2PChat-linux-aarch64-v${pkgver}.zip"
                "${_icon}")
sha256sums_x86_64=('9976208b16de28d2fc8915e1fe42bab3651e868212c688739783d56f735ff6d3'
                   'c49c198bef05e1cf3bf159858acefad100981fb21437e47e2588fcc1e4ad7217')
sha256sums_aarch64=('b7bec5079defeed0219093b2e24d88120d6cfa2cd1e2be32b1e2dad2ae2b6e50'
                    'c49c198bef05e1cf3bf159858acefad100981fb21437e47e2588fcc1e4ad7217')

package() {
  cd "$srcdir"
  case "${CARCH}" in
    x86_64)  _app="I2PChat-linux-x86_64-v${pkgver}.AppImage" ;;
    aarch64) _app="I2PChat-linux-aarch64-v${pkgver}.AppImage" ;;
    *)
      echo "ERROR: unsupported CARCH=${CARCH}" >&2
      exit 1
      ;;
  esac
  install -dm755 "$pkgdir/opt/i2pchat"
  install -Dm755 "$_app" "$pkgdir/opt/i2pchat/I2PChat.AppImage"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/i2pchat.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/i2pchat.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=I2P Chat
Comment=Secure chat over I2P
Exec=/usr/bin/i2pchat %u
Icon=i2pchat
Terminal=false
Categories=Network;Chat;
EOF
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/i2pchat/I2PChat.AppImage "$pkgdir/usr/bin/i2pchat"
}
