# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2021.5
_channel=beta
_rel=2
# beta
pkgver=${_pkgver}.${_channel}${_rel}
# stable
#pkgver=${_pkgver}.${_channel}
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop (beta channel)"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('iputils' 'libnotify' 'libappindicator-gtk3' 'nss')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
install="${pkgname%-*-*}.install"
source=(
        "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-${_channel}${_rel}/MullvadVPN-${_pkgver}-${_channel}${_rel}_amd64.deb"{,.asc} # beta
#        "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc} # stable
        "${pkgname%-*-*}.sh"
       )
sha256sums=('8f43a939c741db564ec90fc75859c07d9358d19458b5ab8c841020beb7dca558'
            'SKIP'
            'a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Link to the GUI binary
  install -m755 "$srcdir/${pkgname%-*-*}.sh" "$pkgdir/usr/bin/${pkgname%-*-*}"

  # Symlink daemon service to correct directory
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/opt/Mullvad VPN/resources/mullvad-daemon.service" \
    "$pkgdir/usr/lib/systemd/system"

  # Move ZSH completions to correct directory
  mv "$pkgdir/usr/local/share/zsh" "$pkgdir/usr/share"
  rm -rf "$pkgdir/usr/local"
}
