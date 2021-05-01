# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=8.0
pkgrel=2
pkgdesc="A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer network"
arch=( 'x86_64' )
depends=('openssl>=1.0' 'dbus' 'icu' 'glib2' 'libxml2' 'libjpeg-turbo' 'nss' 'libxss' 'java-runtime>=1.7.0')
options=('!strip' '!emptydirs')
url="https://www.netacad.com/courses/packet-tracer"
license=('custom')

source=('local://PacketTracer_800_amd64_build212_final.deb'
	'packettracer.sh')
sha512sums=('3a56a369ae2028fa866ad2e27bbe07d1bee14fd0f16f82790c5f7ad9b7a7c3fc39b4b88d52aae652dccf1a21a3ae0f433e8b586ace4f48dfab7271524c5d163c'
	    '3246843441207d66ccffd0717aa85a7bf828842c2c337d1527597bdf57cc2f9966c75c764aa22f9cb6a331e6268dd64af0da7ce4cc89725d418fc54e163230f2')

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
