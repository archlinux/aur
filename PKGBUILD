# Maintainer: arcticblaze <shrikantkhare@gmail.com>
# Contributor: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.6.0
pkgrel=2040
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
sha512sums=('3d1690c303e42645d7d45df9f089b83cfd8f931c67e3197a69b2cff00cd36a2bd4dc7ab34e4b41c902fb42bef3f2e716f9596b37708f5649bf49ecdd1d7ddbc8')

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
