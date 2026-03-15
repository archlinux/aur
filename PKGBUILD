# Maintainer: Zane Schepke <support@wgtunnel.com>
pkgname=wgtunnel-bin
# Update on release
pkgver=1.0.1
pkgrel=1
install=wgtunnel-bin.install
pkgdesc="WireGuard and AmneziaWG VPN client with auto-tunneling, lockdown and proxying"
arch=('x86_64')
url="https://wgtunnel.com"
license=('MIT')

depends=(
  'gtk3'
  'libsecret'
  'gcc-libs'
  'freetype2'
  'fontconfig'
)
optdepends=(
  'libnotify: desktop notifications'
  'gnome-keyring: GNOME keyring backend'
  'kwallet: KDE keyring backend'
)

provides=("wgtunnel=${pkgver}")
conflicts=('wgtunnel' 'wgtunnel-git')
options=(!strip !emptydirs)

source=(
  "wgtunnel-${pkgver}.tar.gz::https://github.com/wgtunnel/desktop/releases/download/${pkgver}/wgtunnel-${pkgver}-linux-amd64.tar.gz"
)

# Update on release
sha256sums=('6bec2d70cb2f6e25f513242d8e82b986ecb9757869c94f295ddab99c873f9028')

package() {
  cd "$srcdir"

  tar -xzf "wgtunnel-${pkgver}.tar.gz"

  # Install full app bundle
  install -d "$pkgdir/usr/lib/wgtunnel"
  cp -a "wgtunnel-${pkgver}/." "$pkgdir/usr/lib/wgtunnel/"

  # Symlink to PATH
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/wgtunnel/bin/wgtunnel \
    "$pkgdir/usr/bin/wgtunnel"
  ln -s /usr/lib/wgtunnel/bin/wgtctl \
    "$pkgdir/usr/bin/wgtctl"

  # Install desktop file
  install -Dm644 \
    "$pkgdir/usr/lib/wgtunnel/share/applications/com.zaneschepke.wireguardautotunnel.wgtunnel.desktop" \
    "$pkgdir/usr/share/applications/com.zaneschepke.wireguardautotunnel.wgtunnel.desktop"

  # Install icons
  cd "$pkgdir/usr/lib/wgtunnel/share/icons/hicolor"
  for size in */; do
      install -d "$pkgdir/usr/share/icons/hicolor/$size"
      cp -a "$size"/* "$pkgdir/usr/share/icons/hicolor/$size/"
  done

  # Install systemd service
  install -Dm644 \
    "$pkgdir/usr/lib/wgtunnel/lib/systemd/system/wgtunnel-daemon.service" \
    "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"

  # Patch service paths
  sed -i 's|ExecStart=.*|ExecStart=/usr/lib/wgtunnel/bin/daemon|' \
    "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"

  sed -i 's|WorkingDirectory=.*|WorkingDirectory=/usr/lib/wgtunnel|' \
    "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"
}