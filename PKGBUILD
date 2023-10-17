# Maintainer: arcticblaze <shrikantkhare@gmail.com>
# Contributor: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.7.2
pkgrel=2157
pkgdesc="Official Surfshark VPN client"
package="surfshark_${pkgver}-${pkgrel}_amd64.deb"
url="https://surfshark.com"
arch=('x86_64')
license=('custom:surfshark')
depends=('gjs' 
         'gtk3'
         'libnma'
         'libnotify'
         'libxtst'
         'networkmanager'
         'networkmanager-openvpn'
         'nss'
         'polkit'
         'zip'
         )
optdepends=('libappindicator-gtk3: for tray icon'
            'org.freedesktop.secrets: password storage backend'
            'emoji-font: emoji support'
            )
provides=('surfsharkvpngui')
conflicts=('surfshark-vpn-gui'
           'surfshark-wireguard'
           'surfshark-wireguard-git'
           'surfshark-vpn'
           'surfshark-client'
           )
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${package}::https://ocean.surfshark.com/debian/pool/main/s/surfshark/${package}")
sha512sums=('021ed3b7f919f1158fe006759e22053ec10a64390164be15780d66ec6e6fd92988d6c561488ef8dcebbc83ba9be33fc517b4e0d192d16c73124a703f9063abb2')

prepare() {
    tar xf data.tar.xz
}

package(){
    mv var/ usr/ opt/ "${pkgdir}"

	# Install License file
	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Create link for surfshark executable in /bin
	mkdir -p "${pkgdir}/usr/bin" && ln -sf "${pkgdir}/opt/Surfshark/surfshark" "${pkgdir}/usr/bin/surfshark"

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${pkgdir}/opt/Surfshark/chrome-sandbox" || true
	
	# Assign correct permissions for systemctl to run surfsharkd service as user
	# Please note that surfsharkd2 systemd service is run as system user and only
	# root user executable permission needs to be set
	chmod 755 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js" || true
	chmod 744 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd2.js" || true
}
