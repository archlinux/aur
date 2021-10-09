# Maintainer: coco
# Co-Maintainer: dramm <dramm at archlinux dot email>
# Contributor: thatgeek
# Contributor: TorGuard Support <support@torguard.com>
pkgname=torguard
pkgver=4.7.7
build=build.68+g6f12bd0
pkgrel=2
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="https://www.torguard.net"
depends=('iproute2'
	'qt5-websockets'
	'qt5-declarative'
	'qt5-quickcontrols2'
	'qt5-svg'
	'shadowsocks-libev'
    'unbound'
	'stunnel')
optdepends=('wireguard-tools: wireguard support')
license=(custom)
source_x86_64=("https://updates.torguard.biz/Software/Linux/torguard-v${pkgver}-amd64-arch.tar.gz")
source=('torguard.sysusers')
sha256sums_x86_64=('9c0e11a9812748edcb9d7393ba9dab99bdf7f4e6adcf10851825cb5f77b3de83')
sha256sums=('b1f954c54725794f94009c72e12746f203ce6dd4318a19ad0c10d5d8684cd873')

prepare() {
	tar -xf "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/torguard-v${pkgver}-${build}-amd64-arch.tar"
}

package() {
	mkdir "$pkgdir"/opt/
	mkdir "$pkgdir"/opt/torguard/
	mkdir "$pkgdir"/opt/torguard/bin/
	mkdir "$pkgdir"/opt/torguard/doc/

	cp "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/opt/torguard/bin/torguard" "${pkgdir}/opt/torguard/bin/"
	cp "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/opt/torguard/bin/torguard-wrapper" "${pkgdir}/opt/torguard/bin/"
	cp "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/opt/torguard/bin/openconnect" "${pkgdir}/opt/torguard/bin/"
	cp "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/opt/torguard/bin/openvpn" "${pkgdir}/opt/torguard/bin/"
	cp "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/opt/torguard/bin/vpnc-script" "${pkgdir}/opt/torguard/bin/"
	cp -r "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/opt/torguard/doc" "${pkgdir}/opt/torguard" -R
	cp -r "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/usr" "${pkgdir}/" -R

	find "$pkgdir"/opt/torguard/ -type f -exec chmod 644 {} \;
	find "$pkgdir"/opt/torguard/ -name torguard -exec chmod 755 {} \;
	find "$pkgdir"/opt/torguard/ -name torguard-wrapper -exec chmod 755 {} \;
	find "$pkgdir"/opt/torguard/ -name openconnect -exec chmod 755 {} \;
	find "$pkgdir"/opt/torguard/ -name openvpn -exec chmod 755 {} \;
	find "$pkgdir"/opt/torguard/ -name vpnc-script -exec chmod 755 {} \;

	install -d "$pkgdir"/usr/bin/
	ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
	ln -s /usr/bin/ss-local "$pkgdir"/opt/torguard/bin/ss-local
	ln -s /usr/bin/stunnel "$pkgdir"/opt/torguard/bin/stunnel

	install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
}
