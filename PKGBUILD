# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.0.5
pkgrel=3
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gdk-pixbuf2' 'gjs' 'glib2' 'gnome-keyring' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'networkmanager>=1.20.0' 'networkmanager-openvpn' 'nspr' 'nss' 'pango' 'wireguard-tools' 'zip')
options=('!strip' '!emptydirs')
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.0.5-547_amd64.deb")
sha512sums=('b4d030f73fc575d908e57c71db5c59ed2a3a138fa7a3e40d5643a50beef8048a981af3b16070d9f8a6dfeed1e32a34d09de10b6c0a0fc06beb1319dc64738522')

package() {
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/Surfshark/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	# https://github.com/electron-userland/electron-builder/blob/master/packages/app-builder-lib/templates/linux/after-install.tpl

	# Link to the binary
	ln -sf '/opt/Surfshark/surfshark' '/usr/bin/surfshark'

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 '/opt/Surfshark/chrome-sandbox' || true

	update-mime-database /usr/share/mime || true
	update-desktop-database /usr/share/applications || true

	# Surfshark post-install
	echo "
	[Unit]
	Description=Surfshark Daemon

	[Service]
	ExecStart=/opt/Surfshark/resources/dist/resources/surfsharkd.js
	Restart=on-failure
	RestartSec=5

	[Install]
	WantedBy=default.target
	" > /usr/lib/systemd/user/surfsharkd.service

	chmod 755 '/opt/Surfshark/resources/dist/resources/surfsharkd.js' || :
	chmod 755 '/opt/Surfshark/resources/dist/resources/update' || :
	chmod 755 '/opt/Surfshark/resources/dist/resources/diagnostics' || :

	systemctl enable --global surfsharkd.service &>/dev/null || :
	update-desktop-database -q
}

post_upgrade() {
	post_install
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	# https://github.com/electron-userland/electron-builder/blob/master/packages/app-builder-lib/templates/linux/after-remove.tpl

	systemctl disable --global surfsharkd.service &>/dev/null || :

	kill -15 $(pidof surfshark) || :
	kill -15 $(pgrep surfsharkd) || :

	rm -f /usr/lib/systemd/user/surfsharkd.service || :

	# Delete the link to the binary
	rm -f '/usr/bin/surfshark'

	# Surfshark post-remove
	nmcli connection delete surfshark_ipv6 &>/dev/null  || :
	nmcli connection delete surfshark_wg &>/dev/null || :
	nmcli connection delete surfshark_openvpn &>/dev/null || :
	rm -rf /home/**/.config/Surfshark
	rm -rf /home/**/.cache/Surfshark
	update-desktop-database -q
}
