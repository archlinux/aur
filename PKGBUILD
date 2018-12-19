# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=openhab2
pkgver=2.4.0
pkgrel=1
pkgdesc="openHAB2 open source home automation software"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime-headless=8')

conflicts=('openhab-runtime' 'openhab-addons')

backup=('etc/openhab2/services/addons.cfg'
		'etc/openhab2/services/runtime.cfg'
		'etc/default/openhab2')
install="${pkgname}.install"

source=("openhab-${pkgver}.tar.gz::https://bintray.com/openhab/mvn/download_file?file_path=org%2Fopenhab%2Fdistro%2Fopenhab%2F${pkgver}%2Fopenhab-${pkgver}.tar.gz"
        "openhab2.service"
	"openhab2.default"
	"openhab2.install"
	"openhab2.patch")

noextract=("openhab-${pkgver}.tar.gz")

sha256sums=('22f68dedf148742079cca9a86430dc99cce70f17919a0e26231db38db6009cb2'
  	'f01ea4cd08608fa0230e13dda23ec9f0b363a1ba417a78908866083a03ab9e0c'
	'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
	'a5ef3d048ab20e73bbb2684fcb3a8b64f9fd1d437bde54b7e51b379d1dacd79e'
	'500118875b0a9f3a4a511bebea3aebaebaa1e8fb5fc1e5c9222e3a287530a5ab')

prepare() {
	mkdir ${srcdir}/openhab2
	cd ${srcdir}/openhab2
	tar xzf ${srcdir}/openhab-${pkgver}.tar.gz
	patch -p1 < ../openhab2.patch
}

package() {

	install -Dm644 openhab2.default "${pkgdir}/etc/default/openhab2"
	install -Dm644 openhab2.service "${pkgdir}/usr/lib/systemd/system/openhab2.service"


	mkdir -p "${pkgdir}/etc/openhab2"
	cp -r ${srcdir}/openhab2/conf/* "${pkgdir}/etc/openhab2"

	mkdir -p "${pkgdir}/var/lib/openhab2"
	cp -r ${srcdir}/openhab2/userdata/* "${pkgdir}/var/lib/openhab2"

	mkdir -p "${pkgdir}/usr/share"
	cp -r "${srcdir}/openhab2" "${pkgdir}/usr/share"
        rm -fr "${pkgdir}/usr/share/openhab2/conf"
        rm -fr "${pkgdir}/usr/share/openhab2/userdata"

	mkdir -p "${pkgdir}/var/log/openhab2"
	
}
