# Maintainer: Aaron Bishop <erroneous at gmail dot com>
pkgname=brewpi-www
pkgver=0.3.2
pkgrel=2
pkgdesc="BrewPi web interface"
arch=('any')
url="http://www.brewpi.com/"
license="GPL"
provides=brewpi-www
depends=('apache'
		 'php-apache'
		 'php'
		 'php-cgi'
		 )

groups=('brewpi-git')

optdepends=('brewpi-script: BrewPi script')

source=(
		"httpd-brewpi.conf"
		"${pkgname}-${pkgver}::https://github.com/BrewPi/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c5489c9f1e6b3d0d8cb046d22842c99848a3e3c916c21b53f64ad983f90247f9'
            'c284243b882a35ef2dab3e5b47cbaf118abc3e5e441a244a64458a22d7e49ff4')

backup=("srv/brewpi/config.php")

package(){
	mkdir -p "${pkgdir}/srv/brewpi" "${pkgdir}/etc/httpd/conf/extra"
	install -m 644 "${srcdir}/httpd-brewpi.conf" "${pkgdir}/etc/httpd/conf/extra/httpd-brewpi.conf"
	cd "${srcdir}/${pkgname}-${pkgver}"
	cp -R *.php *.png defaultSettings.json favicon.ico config_user.php.example css data font js uploads utils "${pkgdir}/srv/brewpi/"
	sed -e "s#scriptPath.*#scriptPath = '/usr/lib/brewpi';#" -i "${pkgdir}/srv/brewpi/config.php"
	chown -R 33:33 "${pkgdir}/srv/brewpi"
	find "${pkgdir}/srv/brewpi" -type d -exec chmod g+rwxs {} \;
}
