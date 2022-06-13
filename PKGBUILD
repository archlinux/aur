# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Matthew McGinn <mamcgi at gmail dot com>
# Contributor: alicewww <almw at protonmail dot com>
pkgname=mullvad-vpn-bin
pkgver=2022.2
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop"
arch=('x86_64')
url="https://www.mullvad.net"
license=('GPL3')
depends=('iputils' 'libnotify' 'libappindicator-gtk3' 'nss')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/$pkgver/MullvadVPN-${pkgver}_amd64.deb"{,.asc}
        "${pkgname%-*}.sh")
sha256sums=('87f73868f1fa1364f36d71913a92c9805f6e1d8723bca896e6ea48a1ba4933da'
            'SKIP'
            'a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Link to the GUI binary
  install -m755 "$srcdir/${pkgname%-*}.sh" "$pkgdir/usr/bin/${pkgname%-*}"

  # Symlink daemon service to correct directory
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/opt/Mullvad VPN/resources/mullvad-daemon.service" \
    "$pkgdir/usr/lib/systemd/system"

  # Move ZSH completions to correct directory
  mv "$pkgdir/usr/local/share/zsh" "$pkgdir/usr/share"
  rm -rf "$pkgdir/usr/local"
}
