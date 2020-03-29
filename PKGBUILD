# Maintainer: coco
# Co-Maintainer: dramm <dramm at archlinux dot email>
# Contributor: thatgeek
# Contributor: TorGuard Support <support@torguard.com>
pkgname=torguard
pkgver=3.98.0
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="https://www.torguard.com"
depends=('iproute2'
	'qt5-websockets'
	'shadowsocks-libev'
    'unbound'
	'stunnel')
license=(custom)
source_x86_64=("https://updates.torguard.biz/Software/Linux/torguard-v${pkgver}-amd64-arch.tar.gz")
source=('torguard.sysusers')
sha256sums_x86_64=('4c5cca699db1bf5b6aca273e7e8f0bd94627e298dafe43147a253001218ca594')
sha256sums=('b1f954c54725794f94009c72e12746f203ce6dd4318a19ad0c10d5d8684cd873')

prepare() {
	tar -xf "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/torguard-v${pkgver}-amd64-arch.tar"
}

package() {
	mkdir "$pkgdir"/opt/
	mkdir "$pkgdir"/opt/torguard/
	mkdir "$pkgdir"/opt/torguard/bin/
	mkdir "$pkgdir"/opt/torguard/doc/
	mkdir "$pkgdir"/opt/torguard/lib/

	cp "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt/torguard/bin/torguard" "${pkgdir}/opt/torguard/bin/"
	cp "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt/torguard/bin/openconnect" "${pkgdir}/opt/torguard/bin/"
	cp "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt/torguard/bin/openvpn_v2_4" "${pkgdir}/opt/torguard/bin/"
	cp "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt/torguard/bin/vpnc-script" "${pkgdir}/opt/torguard/bin/"
	cp "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt/torguard/lib/libQt5EglFSDeviceIntegration.so.5" "${pkgdir}/opt/torguard/lib/"
	cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt/torguard/doc" "${pkgdir}/opt/torguard" -R
	cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/usr" "${pkgdir}/" -R

	find "$pkgdir"/opt/torguard/ -type f -exec chmod 644 {} \;
	find "$pkgdir"/opt/torguard/ -name torguard -exec chmod 755 {} \;
	find "$pkgdir"/opt/torguard/ -name openconnect -exec chmod 755 {} \;
	find "$pkgdir"/opt/torguard/ -name openvpn_v2_4 -exec chmod 755 {} \;
	find "$pkgdir"/opt/torguard/ -name vpnc-script -exec chmod 755 {} \;

	install -d "$pkgdir"/usr/bin/
	ln -s /opt/torguard/bin/torguard "$pkgdir"/usr/bin/torguard
	ln -s /usr/bin/ss-local "$pkgdir"/opt/torguard/bin/ss-local
	ln -s /usr/bin/stunnel "$pkgdir"/opt/torguard/bin/stunnel

	install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
}
