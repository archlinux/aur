# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=openhab2
pkgver=2.1.0
pkgrel=1
pkgdesc="openHAB2 open source home automation software"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime-headless>=8')

conflicts=('openhab-runtime' 'openhab-addons')

backup=('etc/openhab2/services/addons.cfg'
		'etc/openhab2/services/runtime.cfg')
install="${pkgname}.install"

source=("openhab-${pkgver}.tar.gz::https://bintray.com/openhab/mvn/download_file?file_path=org%2Fopenhab%2Fdistro%2Fopenhab%2F${pkgver}%2Fopenhab-${pkgver}.tar.gz"
        "openhab2.service"
	"openhab2.default"
	"openhab2.install"
	"openhab2.patch")

noextract=("openhab-${pkgver}.tar.gz")

sha256sums=('19a5f7dd5a130392b79bcd7348c0b1e54bf4d8a4d0cf4398b56a561f15e213f1'
  	'c1774dc42bbc1b166fc3823351c1d73edf1a40dae628aa33400f585cdd6487ad'
	'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
	'a5ef3d048ab20e73bbb2684fcb3a8b64f9fd1d437bde54b7e51b379d1dacd79e'
	'188ae4cc4e519fbbf5c370cf39bc2a7788d5ab2aab5d766e2adf1b84aeedd9e9')

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
