# Maintainer: submit as i2pchat-bin on AUR (see packaging/aur/README.md)
# Checksums: ./packaging/refresh-checksums.sh vX.Y.Z or sha256sum local zips after release.
pkgname=i2pchat-bin
pkgver=1.3.2
pkgrel=2
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
sha256sums_x86_64=('6d9075d059ba64e59097d61c85e7ea2fe74184cf0c24469dcb66ae9ee6deb557'
                   '2f27e90c85949ec4eabeaac6d12bca1449f679dbb10e4e9f07925e33b7d008b8')
sha256sums_aarch64=('811b84fa6bdb4d99e238410ed172ae19b41715655444b1924e245726ec8abb1d'
                    '2f27e90c85949ec4eabeaac6d12bca1449f679dbb10e4e9f07925e33b7d008b8')

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
