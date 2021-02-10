# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2021.1
_channel=stable
pkgver=${_pkgver}.${_channel}
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop (latest/beta release)"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'nss')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
install="${pkgname%-*-*}.install"
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc}
        "${pkgname%-*-*}.sh")
sha256sums=('079b0ead15fd748a2bc8b130918890106bc2be639e58b27f659547f58f184acf'
            'SKIP'
            'a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin at mullvad dot net>

package() {
	bsdtar -xvf data.tar.xz -C "$pkgdir"

	# Link to the GUI binary
	install -m755 "$srcdir/${pkgname%-*-*}.sh" "$pkgdir/usr/bin/${pkgname%-*-*}"

	# Install daemon service
	install -Dm644 "$pkgdir/opt/Mullvad VPN/resources/mullvad-daemon.service" \
		"$pkgdir/usr/lib/systemd/system/mullvad-daemon.service"

	mv "$pkgdir/usr/local/share/zsh" "$pkgdir/usr/share"
	rm -rf "$pkgdir/usr/local"
}
