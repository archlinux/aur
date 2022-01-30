# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=8.1.1
pkgrel=1
pkgdesc="A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer network"
arch=( 'x86_64' )
depends=('openssl>=1.0' 'dbus' 'icu' 'glib2' 'libxml2' 'libjpeg-turbo' 'nss' 'libxss' 'java-runtime>=1.7.0')
options=('!strip' '!emptydirs')
url="https://www.netacad.com/courses/packet-tracer"
license=('custom')

source=('local://CiscoPacketTracer_811_Ubuntu_64bit.deb'
	'packettracer.sh')
sha512sums=('0ad6dbda9ecc4e7da26f121abacb90db3608ca6405f8b1bc0c4cf4961375a03b0ce3bd43874382709b14a3e932c4c797de4eac6fa8254980dfc4c1f6ba3e7c20'
	    '47d575abf87ff26917ced452922ae6030b548e0deecca66397dbd4e22c032e217fcb4219b1bc783e6efa5fcbc4472dbe75b0d26f9d07de63a63d720475eb5122')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 ${pkgdir}
	mv ${pkgdir}/opt/pt/ ${pkgdir}/opt/packettracer/
	mkdir -p "${pkgdir}/usr/bin/"

	find "${pkgdir}" -type d -exec chmod 755 {} \;
	find "${pkgdir}/opt/packettracer/help/" -type d -exec chmod 777 {} \;
	find "${pkgdir}/opt/packettracer/saves/" -type d -exec chmod 555 {} \;
	find "${pkgdir}/opt/packettracer/art/html/network_controller/" -type d -exec chmod 775 {} \;
	find "${pkgdir}/opt/packettracer/art/RackView/CablePegboard/" -type d -exec chmod 775 {} \;
	find "${pkgdir}/opt/packettracer/bin/xcbglintegrations/" -type d -exec chmod 775 {} \;
	find "${pkgdir}/opt/packettracer/help/default/NetconRestAPI/" -type d -exec chmod 775 {} \;
	
	ln -s /opt/packettracer/packettracer "${pkgdir}/usr/bin/packettracer"

	ln -s /usr/lib/libdouble-conversion.so "${pkgdir}/opt/packettracer/bin/libdouble-conversion.so.1"

	sed -i 's|/opt/pt|/opt/packettracer|' "${pkgdir}/opt/packettracer/linguist" "${pkgdir}/opt/packettracer/packettracer" "${pkgdir}/usr/share/applications/cisco-pt.desktop" "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"

	sed -i -e "\$aCategories=Network;" "${pkgdir}/usr/share/applications/cisco-pt.desktop" "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"

	install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"

	install -D -m644 "${pkgdir}/opt/packettracer/help/default/copyrights.htm" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
