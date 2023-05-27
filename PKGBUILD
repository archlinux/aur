# Maintainer: arcticblaze <shrikantkhare@gmail.com>
# Contributor: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.4.0
pkgrel=1733
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
url="https://surfshark.com"
arch=('x86_64')
license=('custom:surfshark')
depends=('curl' 'dbus' 'gjs' 'gtk3' 'iptables' 'libnma' 'libnotify' 'libxtst' 'networkmanager' 'networkmanager-openvpn' 'nss' 'polkit' 'zip')
optdepends=('libappindicator-gtk3' 'gnome-keyring' 'kwallet' 'noto-fonts-emoji')
provides=('surfsharkvpngui')
conflicts=('surfshark-vpn-gui' 'surfshark-wireguard' 'surfshark-wireguard-git' 'surfshark-vpn' 'surfshark-client')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.4.0-1733_amd64.deb")
sha512sums=('f9396114852ca0b57681c5f9809ae0b6285180c21d4e52a1195e350b221a89373248cc884a2228e17a4c3c0ce7eb07b55554873cebfabc302dc8e062984ffe97')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	
	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Delete unneeded init files
	rm -f "${pkgdir}/etc/init.d/surfshark" || true
	rm -f "${pkgdir}/etc/init.d/surfshark2" || true
	rmdir "${pkgdir}/etc/init.d" || true
	
	mkdir -p "${pkgdir}/usr/bin" && ln -sf "${pkgdir}/opt/Surfshark/surfshark" "${pkgdir}/usr/bin/surfshark"

	chmod 4755 "${pkgdir}/opt/Surfshark/chrome-sandbox" || true
	chmod 755 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js" || true
	chmod 755 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd2.js" || true
	chmod 755 "${pkgdir}/opt/Surfshark/resources/dist/resources/update" || true
	chmod 755 "${pkgdir}/opt/Surfshark/resources/dist/resources/diagnostics" || true
	
	# Create Surfshark Service
	echo "
	[Unit]
	Description=Surfshark Daemon2

	[Service]
	ExecStart=/opt/Surfshark/resources/dist/resources/surfsharkd2.js
	Restart=on-failure
	RestartSec=5
	IPAddressDeny=any
	RestrictRealtime=true
	ProtectKernelTunables=true
	ProtectSystem=full
	RestrictSUIDSGID=true

	[Install]
	WantedBy=default.target
	" > "${pkgdir}/usr/lib/systemd/system/surfsharkd2.service" || true

	chmod 644 "${pkgdir}/usr/lib/systemd/system/surfsharkd2.service"
	
	# Suppress directory permission warnings
	chmod 755 "${pkgdir}/usr"
	chmod 755 "${pkgdir}/usr/lib"
	chmod 755 "${pkgdir}/usr/lib/systemd"
	chmod 755 "${pkgdir}/usr/lib/systemd/system"
	chmod 755 "${pkgdir}/usr/lib/systemd/user"
	chmod 755 "${pkgdir}/var"
	chmod 755 "${pkgdir}/var/lib"
}
