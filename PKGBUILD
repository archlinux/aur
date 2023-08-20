# Maintainer: HLFH <gaspard@dhautefeuille.eu>
pkgname=openlitespeed-bin
_pkgname=openlitespeed
pkgver=1.7.18
pkgrel=1
pkgdesc="A high-performance, lightweight, open source HTTP server"
arch=('x86_64' 'i686')
url="https://openlitespeed.org/downloads/"
license=('GPL3')
depends=('pcre' 'rcs' 'geoip' 'expat' 'openssl' 'libzip')
provides=('openlitespeed')
options=()
source=("https://openlitespeed.org/packages/openlitespeed-$pkgver.tgz")
b2sums=('9f691f44075ead834e32cacbcb08a1e6d516ca778adab26b70f7f58b232a7b1daf27f198965f13e1e45bc401f72471e2a690ae3d1054cb1b3d4404df19fb6827')
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
