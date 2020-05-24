# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=7.3.0
pkgrel=5
pkgdesc="Cisco PacketTracer 7.3.0 installation package"
arch=( 'x86_64' )
depends=('openssl-1.0' 'dbus' 'icu' 'glib2' 'libxml2' 'libjpeg-turbo' 'nss')
options=('!strip' '!emptydirs')
url="https://www.netacad.com/courses/packet-tracer"
install=${pkgname}.install
license=('custom')

source=('local://PacketTracer_730_amd64.deb'
	'packettracer.sh')
sha512sums=('b06275775703791d56618d99fa7daf29a8a5c82dc17b66d12a9b29927f0a97deb082a757c0cdf72c2345ac32449d0506dad35237ac9935db2e86982e115f1ae1'
	    '74b90fc9f9e37b9d69bff1d43b97589563331b4dbbd89002447ad09d4454466321998cb0bbaeba478603c1038ef5be74b797c1a122dbb13150f8abdce174782c')

package() {

	tar xf data.tar.xz -C "${pkgdir}"

	mv ${pkgdir}/opt/pt/ ${pkgdir}/opt/packettracer/

	mkdir -p "${pkgdir}/usr/bin/"
	ln -s /opt/packettracer/packettracer "${pkgdir}/usr/bin/packettracer"

	ln -s /usr/lib/libdouble-conversion.so "${pkgdir}/opt/packettracer/bin/libdouble-conversion.so.1"

	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/linguist"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/packettracer"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/bin/Cisco-PacketTracer.desktop"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/usr/share/applications/cisco-pt7.desktop"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/usr/share/applications/cisco-ptsa7.desktop"
	sed -e "\$aCategories=Application;Network;" -i "${pkgdir}/usr/share/applications/cisco-pt7.desktop"
	sed -e "\$aCategories=Application;Network;" -i "${pkgdir}/usr/share/applications/cisco-ptsa7.desktop"
	sed -e "\$aNoDisplay=true" -i "${pkgdir}/usr/share/applications/cisco-ptsa7.desktop"

	install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"

	install -D -m644 "${pkgdir}/opt/packettracer/saves/Switch/IE_2000/upgrade_downgrade_license_on_ie2000.pkt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/packettracer/help/default/copyrights.htm" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -D -m644 "${pkgdir}/opt/packettracer/eula730.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"

}
