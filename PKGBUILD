# Maintainer: dcordonu
# Maintainer: Christian Kohlstedde <christian+archlinux@kohlsted.de>

pkgname=connect-tunnel
pkgver=12.43.00283
pkgrel=1
pkgdesc="SonicWALL Connect Tunnel VPN Client"
arch=('x86_64')
url="https://www.sonicwall.com/products/remote-access/vpn-clients/"
depends=('java-runtime' 'perl')
makedepends=('tar' 'gendesk')
license=('custom')
source=(
	"https://software.sonicwall.com/CT-NX-VPNClients/CT-$(sed 's/[0-9]$/.&/' <<<"${pkgver%.*}")/ConnectTunnel_Linux64-${pkgver}.tar"
	"https://www.sonicwall.com/legal/general-product-agreement"
)
md5sums=(
	'1c7a5ad5c6b582ceb73805200667b5b4'
	'SKIP'
)

prepare() {
	tar -xf ConnectTunnel-Linux64-${pkgver}.tar.bz2
	gendesk -n -f --pkgname ${pkgname} --pkgdesc "${pkgdesc}" --name "Connect Tunnel" --exec startctui

	cd usr/local/Aventail
	rm certs.tar.bz2
	rm uninstall.sh
}

package() {
	install -dm 0755 "${pkgdir}"/usr/local
	cp -r usr/local/Aventail "${pkgdir}"/usr/local

	chmod 0755 "${pkgdir}"/usr/local/Aventail/startct.sh
	chmod 0755 "${pkgdir}"/usr/local/Aventail/startctui.sh
	chmod 4755 "${pkgdir}"/usr/local/Aventail/AvConnect

	install -Dm 0644 version "${pkgdir}"/usr/local/Aventail/version

	install -dm 0755 "${pkgdir}"/usr/bin
	ln -s /usr/local/Aventail/startct.sh "${pkgdir}"/usr/bin/startct
	ln -s /usr/local/Aventail/startctui.sh "${pkgdir}"/usr/bin/startctui
	ln -s /etc/ca-certificates/extracted/tls-ca-bundle.pem "${pkgdir}"/usr/local/Aventail/cert.pem

	install -Dm 0644 general-product-agreement "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

	install -Dm 0644 usr/local/Aventail/ui/logo.png "${pkgdir}"/usr/share/pixmaps/connect-tunnel.png
	install -Dm 0644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
