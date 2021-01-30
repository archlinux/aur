# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=8.0
pkgrel=1
pkgdesc="Cisco PacketTracer 8.0 installation package"
arch=( 'x86_64' )
depends=('openssl>=1.0' 'dbus' 'icu' 'glib2' 'libxml2' 'libjpeg-turbo' 'nss' 'libxss')
options=('!strip' '!emptydirs')
url="https://www.netacad.com/courses/packet-tracer"
install=${pkgname}.install
license=('custom')

source=('local://PacketTracer_800_amd64_build212_final.deb'
	'packettracer.sh'
	'packettracer.install')
sha512sums=('3a56a369ae2028fa866ad2e27bbe07d1bee14fd0f16f82790c5f7ad9b7a7c3fc39b4b88d52aae652dccf1a21a3ae0f433e8b586ace4f48dfab7271524c5d163c'
	    '3246843441207d66ccffd0717aa85a7bf828842c2c337d1527597bdf57cc2f9966c75c764aa22f9cb6a331e6268dd64af0da7ce4cc89725d418fc54e163230f2'
	    'c0e894ff34e5e635574edcca9cd06dddc1706deef82032a964f779c1ac734e41ba328287ee7a8c989b9c4baf6a517e4d482465803f8f2dabd691616bf972cb7a')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 ${pkgdir}
	mv ${pkgdir}/opt/pt/ ${pkgdir}/opt/packettracer/

	mkdir -p "${pkgdir}/usr/bin/"
	ln -s /opt/packettracer/packettracer "${pkgdir}/usr/bin/packettracer"

	ln -s /usr/lib/libdouble-conversion.so "${pkgdir}/opt/packettracer/bin/libdouble-conversion.so.1"

	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/linguist"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/packettracer"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/usr/share/applications/cisco-pt.desktop"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"
	sed -e "\$aCategories=Application;Network;" -i "${pkgdir}/usr/share/applications/cisco-pt.desktop"
	sed -e "\$aCategories=Application;Network;" -i "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"
	sed -e "\$aNoDisplay=true" -i "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"

	install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"

	install -D -m644 "${pkgdir}/opt/packettracer/saves/Switch/IE_2000/upgrade_downgrade_license_on_ie2000.pkt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/packettracer/help/default/copyrights.htm" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
