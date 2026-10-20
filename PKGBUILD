# Maintainer: Nicolas Ramirez-Diaz <support at tephro dot chat>
# The AUR's tephro-client-bin, written by `make aur CLIENT=X.Y.Z` from
# client/deploy/aur/PKGBUILD.in. Edit the template in the Tephro repository,
# not the copy on the AUR.
#
# The release's own .deb, unpacked: the same /opt/Tephro tree, Electron
# included, that the .deb, the .rpm and the local package install. The hash
# comes from the release's SHA256SUMS after its OpenPGP signature verified.
# depends= matches client/deploy/pacman/PKGBUILD, where the list is explained.
pkgname=tephro-client-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Self-hosted group chat client: text, voice, video and screen sharing (release build)"
arch=('x86_64')
url="https://tephro.chat"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'nss' 'libnotify' 'alsa-lib' 'libpulse' 'libsecret' 'libxss' 'libxtst' 'xdg-utils' 'hicolor-icon-theme')
optdepends=(
  'xdg-desktop-portal: screen sharing under Wayland'
  'pipewire: screen sharing and per-application stream audio under Wayland'
  'libappindicator: tray icon on Unity/older GNOME Shell (KDE gets one via StatusNotifierItem regardless)'
  'libayatana-appindicator: alternative tray icon backend'
)
provides=('tephro-client')
conflicts=('tephro-client')
# Prebuilt Electron/Chromium binaries. Stripping or relinking corrupts them.
options=('!strip' '!debug')
install=tephro-client.install
source=("tephro-client_${pkgver}_amd64.deb::https://gitlab.com/encenillo/tephro/-/releases/client%2Fv${pkgver}/downloads/tephro-client_${pkgver}_amd64.deb")
sha256sums=('2ca4865712c89136ed32159881721d14ce6d60b5a0a1d98b383a960426876758')

package() {
  bsdtar --no-same-owner -xf data.tar.xz -C "$pkgdir" ./opt ./usr/share/applications ./usr/share/icons
  # non-setuid by default. tephro-client.install raises it only if this
  # machine has no unprivileged user namespaces at install time
  chmod 0755 "$pkgdir/opt/Tephro/chrome-sandbox"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Tephro/tephro "$pkgdir/usr/bin/tephro"
}
