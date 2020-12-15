# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=openhab2
pkgver=2.5.11
pkgrel=1
pkgdesc="openHAB2 open source home automation software"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime-headless=8' 'archlinux-java-run')

conflicts=('openhab-runtime' 'openhab-addons' 'openhab-beta')

backup=('etc/openhab2/services/addons.cfg'
		'etc/openhab2/services/runtime.cfg'
		'etc/default/openhab2'
		'var/lib/openhab2/etc/keystore'
		'var/lib/openhab2/etc/users.properties'
		'var/lib/openhab2/etc/keys.properties')

install="${pkgname}.install"

source=("openhab-${pkgver}.tar.gz::https://bintray.com/openhab/mvn/download_file?file_path=org%2Fopenhab%2Fdistro%2Fopenhab%2F${pkgver}%2Fopenhab-${pkgver}.tar.gz"
        "openhab2.service"
	"openhab2.default"
	"openhab2.install"
	"openhab2.patch"
	"karaf_wrapper.sh")

noextract=("openhab-${pkgver}.tar.gz")

sha256sums=('edff418da20464fc3fbc28f9790b122c53ddb8a53bf4f79041a7645c0ba49ac8'
            'd7bb21c0e0dc27534af29a9a5538ccbcf801b08afe41ba84be738f44456510aa'
            'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
            'c6ddfcf9d38882ef50cdff6eb9a5df4d3577c07771a8c6d91484d1d84ad63705'
            '500118875b0a9f3a4a511bebea3aebaebaa1e8fb5fc1e5c9222e3a287530a5ab'
            'd61ebec172e2a173dbe94f534035b55250e1b09f4cab5665d275ccfcdf3e710e')

prepare() {
	if [[ ! -d ${srcdir}/openhab2 ]]; then
		mkdir ${srcdir}/openhab2
	fi
	cd ${srcdir}/openhab2
	tar xzf ${srcdir}/openhab-${pkgver}.tar.gz
	patch -p1 < ../openhab2.patch
}

package() {

	install -Dm644 openhab2.default "${pkgdir}/etc/default/openhab2"
	install -Dm644 openhab2.service "${pkgdir}/usr/lib/systemd/system/openhab2.service"
	install -Dm755 karaf_wrapper.sh "${pkgdir}/usr/share/openhab2/karaf_wrapper.sh"

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
