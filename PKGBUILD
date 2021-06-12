# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2021.4
_channel=beta
pkgver=${_pkgver}.${_channel}1
pkgrel=3
pkgdesc="The Mullvad VPN client app for desktop (beta channel)"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('iputils' 'libnotify' 'libappindicator-gtk3' 'nss')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
install="${pkgname%-*-*}.install"
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-${_channel}1/MullvadVPN-${_pkgver}-${_channel}1_amd64.deb"{,.asc} # beta
#        "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc} # stable
        "${pkgname%-*-*}.sh")
sha256sums=('ba7705c4e303a35aa2c0d107f960105a51c60662b047b8641efcdcbf15d830bc'
            'SKIP'
            'a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

package() {
	bsdtar -xvf data.tar.xz -C "$pkgdir"

	# Link to the GUI binary
	install -m755 "$srcdir/${pkgname%-*-*}.sh" "$pkgdir/usr/bin/${pkgname%-*-*}"

	# Restrict management socket access to wheel group
	sed -i '/\[Service\]/a Environment="MULLVAD_MANAGEMENT_SOCKET_GROUP=wheel"' \
		"$pkgdir/opt/Mullvad VPN/resources/mullvad-daemon.service"

	# Symlink daemon service to correct directory
	install -d "$pkgdir/usr/lib/systemd/system"
	ln -s "/opt/Mullvad VPN/resources/mullvad-daemon.service" \
		"$pkgdir/usr/lib/systemd/system"

	# Move ZSH completions to correct directory
	mv "$pkgdir/usr/local/share/zsh" "$pkgdir/usr/share"
	rm -rf "$pkgdir/usr/local"
}
