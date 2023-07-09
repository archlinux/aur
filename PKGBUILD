# Maintainer: HLFH <gaspard@dhautefeuille.eu>
pkgname=openlitespeed-bin
_pkgname=openlitespeed
pkgver=1.7.17
pkgrel=1
pkgdesc="A high-performance, lightweight, open source HTTP server"
arch=('x86_64' 'i686')
url="https://openlitespeed.org/downloads/"
license=('GPL3')
depends=('pcre' 'rcs' 'geoip' 'expat' 'openssl' 'libzip')
provides=('openlitespeed')
options=()
source=("https://openlitespeed.org/packages/openlitespeed-$pkgver.tgz")
b2sums=('8f4a9bba42dfd5794ce899ced2e5af78a67bfa4792d7064427e6d771c1b7063f0f787bccee6cb8938c9124c76ce5983e91deace29ca117f63e5c16a1d3bcdd0f')
build() {
	cd "$_pkgname"
	echo "SERVERROOT=$pkgdir/usr/local/lsws" >> ols.conf
	#Make a default password
	echo "OPENLSWS_PASSWORD=123456" >> ols.conf

}
package() {
	cd "$_pkgname"
	install -dm644 "${pkgdir}/usr/local/"
	./install.sh
	#Replace $pkgdir to / in installed files.
	cd "${pkgdir}/usr/local/lsws/admin/misc"
	sed -i 's,'"${pkgdir}"',/,g' *
	#Install systemd service
	install -Dm0644 "${pkgdir}/usr/local/lsws/admin/misc/lshttpd.service" "${pkgdir}/usr/lib/systemd/system/lshttpd.service"
	#This fix for building lsphp in openlitespeed. Default PHP is 5.6
	cd "${pkgdir}/usr/local/lsws/fcgi-bin"
	rm lsphp
	ln -s lsphp5 lsphp
}
