# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=8.2.2
pkgrel=1
pkgdesc="A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer network"
arch=( 'x86_64' )
depends=('openssl>=1.0' 'dbus' 'icu' 'glib2' 'libxml2-legacy' 'libjpeg-turbo' 'nss' 'libxss' 'java-runtime>=1.7.0' 'qt5-multimedia' 'qt5-webengine' 'qt5-svg' 'qt5-networkauth' 'qt5-websockets' 'qt5-script' 'qt5-speech')
options=('!strip' '!emptydirs')
url="https://www.netacad.com/courses/packet-tracer"
license=('LicenseRef-Cisco-EULA')

source=('local://Packet_Tracer822_amd64_signed.deb'
	'packettracer.sh'
	'cisco-pt.desktop'
	'cisco-ptsa.desktop')
sha512sums=('55835357b01449150f5c962d852f2921d4e39f697297cb34471b8cc83a91bced6c31703cc28a90e61db7a9a32e5534de4f11e5c4f6735f400456d25a013fadde'
            '3bb9bf12a31e9acf1526918dfed7fbd0dcac333afd40de9a325d7139d88b07e9dda9173294b99a537571828d2e1f5e7b7f1a4b5c1af976f8df29159ddd0c6ad0'
            '53eb2b6ac46a22ff519b01ba33628d31ef1b1d87be6fa45bed36ce49e61e6c99c21761751e6cc8135cf78fda25fe44cb49bd6762ed0fc71c1a8b952b50039b25'
            '619585cef99634e950b5906bddd995e85b0ddfcf426ef9eff93450aafd88299e7eed15a783ed3bdd3aab14a781093b740a62bdaa2f0750c94c18f1403030771a')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 "${pkgdir}"
	mkdir -p "${pkgdir}/usr/lib/"
	mv "${pkgdir}/opt/pt/" "${pkgdir}/usr/lib/packettracer/"
	mkdir -p "${pkgdir}/usr/share/applications/"
	install -D -m755 "${srcdir}/cisco-pt.desktop" "${pkgdir}/usr/share/applications/cisco-pt.desktop"
	install -D -m755 "${srcdir}/cisco-ptsa.desktop" "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"
	chmod a+x "${pkgdir}/usr/share/applications/cisco-pt.desktop"
	chmod a+x "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"
	mkdir -p "${pkgdir}/usr/bin/"

	find "${pkgdir}" -type d -exec chmod 755 {} \;
	find "${pkgdir}/usr/lib/packettracer/help/" -type d -exec chmod 777 {} \;
	find "${pkgdir}/usr/lib/packettracer/saves/" -type d -exec chmod 555 {} \;
	find "${pkgdir}/usr/lib/packettracer/art/html/network_controller/" -type d -exec chmod 775 {} \;
	find "${pkgdir}/usr/lib/packettracer/art/RackView/CablePegboard/" -type d -exec chmod 775 {} \;
	find "${pkgdir}/usr/lib/packettracer/bin/xcbglintegrations/" -type d -exec chmod 775 {} \;
	find "${pkgdir}/usr/lib/packettracer/help/default/NetconRestAPI/" -type d -exec chmod 775 {} \;
	
	ln -s /usr/lib/packettracer/packettracer "${pkgdir}/usr/bin/packettracer"

	ln -s /usr/lib/lib/libdouble-conversion.so "${pkgdir}/usr/lib/packettracer/bin/libdouble-conversion.so.1"

	sed -i 's|/opt/pt|/usr/lib/packettracer|' "${pkgdir}/usr/lib/packettracer/linguist" "${pkgdir}/usr/lib/packettracer/packettracer"

	install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"

	install -D -m644 "${pkgdir}/usr/lib/packettracer/help/default/copyrights.htm" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
