# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=8.2.1
pkgrel=1
pkgdesc="A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer network"
arch=( 'x86_64' )
depends=('openssl>=1.0' 'dbus' 'icu' 'glib2' 'libxml2' 'libjpeg-turbo' 'nss' 'libxss' 'java-runtime>=1.7.0' 'qt5-multimedia' 'qt5-webengine' 'qt5-svg' 'qt5-networkauth' 'qt5-websockets' 'qt5-script' 'qt5-speech')
options=('!strip' '!emptydirs')
url="https://www.netacad.com/courses/packet-tracer"
license=('custom')

source=('local://CiscoPacketTracer_821_Ubuntu_64bit.deb'
	'packettracer.sh'
	'cisco-pt.desktop'
	'cisco-ptsa.desktop')
sha512sums=('21049b337714c216ce9257f4dda3f157cbd282adee30e688dfcb61681f381a60f839d376d97ddb66e4e716a6bdce6346ea2047c05bbfaa19d507eda4f52c3cb2'
	    '47d575abf87ff26917ced452922ae6030b548e0deecca66397dbd4e22c032e217fcb4219b1bc783e6efa5fcbc4472dbe75b0d26f9d07de63a63d720475eb5122'
	    '2db30a687e8546c83613bffbf43ac98311e66aa42b0264e60ac678c7152336f4b046c46e71cba53ebd45c5ddb702552e9496efd93a143fcef7ebe31ad2bbad64'
	    '3a67dbc2437e213b6999384b574f1251feed25791d5427197bfc3edf384ee938c449dccd482e6dfccceb43a274199718a957671658054dc9931d1c3479590fcd')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 "${pkgdir}"
	mv "${pkgdir}/opt/pt/" "${pkgdir}/opt/packettracer/"
	mkdir -p "${pkgdir}/usr/share/applications/"
	mv "${srcdir}/cisco-pt.desktop" "${pkgdir}/usr/share/applications/cisco-pt.desktop"
	mv "${srcdir}/cisco-ptsa.desktop" "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"
	chmod a+x "${pkgdir}/usr/share/applications/cisco-pt.desktop"
	chmod a+x "${pkgdir}/usr/share/applications/cisco-ptsa.desktop"
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

	sed -i 's|/opt/pt|/opt/packettracer|' "${pkgdir}/opt/packettracer/linguist" "${pkgdir}/opt/packettracer/packettracer"

	install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"

	install -D -m644 "${pkgdir}/opt/packettracer/help/default/copyrights.htm" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
