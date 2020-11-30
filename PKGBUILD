# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=openhab3
pkgver=3.0.0.M4
pkgrel=1
pkgdesc="openhab3 open source home automation software"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime-headless=11')

conflicts=('openhab-runtime' 'openhab-addons' 'openhab-beta' 'openhab2')

backup=('etc/openhab3/services/addons.cfg'
		'etc/openhab3/services/runtime.cfg'
		'etc/default/openhab3'
		'var/lib/openhab3/etc/keystore'
		'var/lib/openhab3/etc/users.properties'
		'var/lib/openhab3/etc/keys.properties')

install="${pkgname}.install"

source=("openhab-${pkgver}.tar.gz::https://openhab.jfrog.io/openhab/libs-milestone-local/org/openhab/distro/openhab/${pkgver}/openhab-${pkgver}.tar.gz"
        "openhab3.service"
	"openhab3.default"
	"openhab3.install"
	"openhab3.patch")

noextract=("openhab-${pkgver}.tar.gz")

sha256sums=('63b1725ab2e37ee25649663362fb08bedb6f9c1727c5511543eef2d8048d008c'
            'a948b1c74fe41038ca2aa6a7c46416c7ad15eab4b22948161b95b092b9e8c642'
            'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
            '3f75538c64fd02120ccfcfa1024e8414514536708255e9218b5cc0bd995715c5'
            '3f7478e5742ff504b3200b580eba84bd10f9adde24c0a5e070dda71125a69c3b')

prepare() {
	if [[ ! -d ${srcdir}/openhab3 ]]; then
		mkdir ${srcdir}/openhab3
	fi
	cd ${srcdir}/openhab3
	tar xzf ${srcdir}/openhab-${pkgver}.tar.gz
	patch -p1 < ../openhab3.patch
}

package() {

	install -Dm644 openhab3.default "${pkgdir}/etc/default/openhab3"
	install -Dm644 openhab3.service "${pkgdir}/usr/lib/systemd/system/openhab3.service"


	mkdir -p "${pkgdir}/etc/openhab3"
	cp -r ${srcdir}/openhab3/conf/* "${pkgdir}/etc/openhab3"

	mkdir -p "${pkgdir}/var/lib/openhab3"
	cp -r ${srcdir}/openhab3/userdata/* "${pkgdir}/var/lib/openhab3"

	mkdir -p "${pkgdir}/usr/share"
	cp -r "${srcdir}/openhab3" "${pkgdir}/usr/share"

	rm -fr "${pkgdir}/usr/share/openhab3/conf"
	rm -fr "${pkgdir}/usr/share/openhab3/userdata"

	mkdir -p "${pkgdir}/var/log/openhab3"

}
