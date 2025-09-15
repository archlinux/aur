# Maintainer: Liam Doan <not.lamdn@gmail.com>

pkgname=surfshark-client
pkgver=3.5.4
pkgrel=3
pkgdesc="Official Surfshark VPN client"
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=(
	'gjs'
	'nss'
	'networkmanager'
	'networkmanager-openvpn'
)
optdepends=(
	'libappindicator-gtk3: for tray icon'
	'org.freedesktop.secrets: password storage backend'
	'emoji-font: emoji support'
)
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark_${pkgver}_amd64.deb")
sha512sums=('e51bd526e61aa14bbe2b5a8436f34352e87f00bbfc4913ba29029ca8c1de81bfd3d7667d7787b5b91cd995e4efd92bca80bd8ed6af5930aa5ae58fd63c38a82f')

prepare() {
    tar xf data.tar.xz
}

package(){
    cp -rp usr/ opt/ etc/ "${pkgdir}"

	# Install License file
	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Create link for surfshark executable in /bin
	mkdir -p "${pkgdir}/usr/bin" && ln -sf "/opt/Surfshark/surfshark" "${pkgdir}/usr/bin/surfshark"

	# Correct permissions on OpenVPN secrets
	chmod 750 "${pkgdir}/etc/openvpn/client"

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${pkgdir}/opt/Surfshark/chrome-sandbox" || true
	
	# Assign correct permissions for systemctl to run surfsharkd service as user
	chmod 755 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js" || true
	chmod 744 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd2.js" || true

	# Permissions for update and diagnostics
	chmod 755 "${pkgdir}/opt/Surfshark/resources/dist/resources/update" || true
	chmod 755 "${pkgdir}/opt/Surfshark/resources/dist/resources/diagnostics" || true
	 
}
