# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mullvad-vpn-beta-bin
_pkgver=2025.4
_channel=beta
_rel=1
pkgver=${_pkgver}.${_channel}${_rel}  # beta
#pkgver=${_pkgver}.${_channel}  # stable
pkgrel=3
pkgdesc="The Mullvad VPN client app for desktop (beta channel)"
arch=('x86_64' 'aarch64')
url="https://www.mullvad.net"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'iputils'
  'libnftnl'
  'libnotify'
  'nss'
)
optdepends=('libappindicator-gtk3: tray icon')
provides=('mullvad-vpn')
conflicts=('mullvad-vpn')
install='mullvad-vpn.install'
source=('mullvad-vpn.sh')
source_x86_64=(
  "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-beta${_rel}/MullvadVPN-${_pkgver}-beta${_rel}_amd64.deb"{,.asc}  # beta
#  "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc}  # stable
  )
source_aarch64=(
  "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-beta${_rel}/MullvadVPN-${_pkgver}-beta${_rel}_arm64.deb"{,.asc}  # beta
#  "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_arm64.deb"{,.asc}  # stable
  )
sha256sums=('a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
sha256sums_x86_64=('47cb5a4b973ea2a822243777f0da03ed6dc13d885e0a597757753ae0202d1930'
                   'SKIP')
sha256sums_aarch64=('1c7ca894ad218483bfa87b5b83397c74522b47afe4d2b0e68a04b368e84b1a78'
                    'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"
  chmod 4755 "$pkgdir/opt/Mullvad VPN/chrome-sandbox"

  # Link to the GUI binary
  install -m755 "$srcdir/mullvad-vpn.sh" "$pkgdir/usr/bin/mullvad-vpn"

  # Symlink apparmor profile to allow Electron sandbox to work
  install -d "$pkgdir/etc/apparmor.d"
  ln -s /opt/Mullvad\ VPN/resources/apparmor_mullvad "$pkgdir/etc/apparmor.d/mullvad"

  # Move ZSH completions to correct directory
  mv "$pkgdir/usr/local/share/zsh" "$pkgdir/usr/share/"
  rm -rf "$pkgdir/usr/local"
}
