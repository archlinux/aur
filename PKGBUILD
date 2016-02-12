# Maintainer: Aaron Bishop <erroneous at gmail dot com>
pkgname=brewpi-script
pkgver=0.3.8
pkgrel=2
pkgdesc="The BrewPi Python script logs the data, monitors the temperature profile and communicates with the BrewPi slave and the web server"
arch=('any')
url="http://www.brewpi.com/"
license="GPL"
provides=brewpi-script
depends=('python'
		 'python-pyserial'
		 'python-psutil'
		 'python-simplejson'
		 'python-configobj'
		 'avrdude'
		 'avr-gcc'
		 )
optdepends=('brewpi-www: Web interface for BrewPi')

groups=('brewpi-git')

makedepends=('git')

source=("https://github.com/BrewPi/${pkgname}/archive/${pkgver}.tar.gz"
		'https://www.arduino.cc/en/uploads/Main/boards.txt'
		'brewpi.service'
		'brewpi-script.install'
		'config.cfg'
		'fix_dep_syntax.patch'
		'brewpi')
sha256sums=('cf539d29b2354e90e90f7f0ec9ab20a3d0e9828f900a15d2d213db12190833e6'
            '4558674f15fcd3dc3bd3b5f07a921a9344f8d890df9c088a62cb912e61ec3a3a'
            'fdc675b89fbea15b9f66a70d3cb3fdf73f7419047029a55e415dd9875424c1ca'
            '53540750e3ef7e41328f4362b0ebba1f81a310797f6aefdb7f17108ba1d092b4'
            '29e9ec7169272f2f0324791793b121b9b68ab327791717ac5718e16e352146e3'
            'cbbfff08299d923e001125400f97cbe2737575e6103b819da9848ff73e081b19'
            'de04e81bc5cc5d999a130ad3140af876f1ad8d2813a34ca68521d4cf14b1b9f4')

backup=('usr/lib/brewpi/settings/config.cfg')

install=brewpi-script.install

package(){
	mkdir -m 755 -p "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/bin"
	mkdir -m 775 -p "${pkgdir}/usr/lib/brewpi/settings"
	install -m 644 "${srcdir}/brewpi.service" "${pkgdir}/usr/lib/systemd/system/brewpi.service"
	install -m 644 "${srcdir}/boards.txt" "${pkgdir}/usr/lib/brewpi/settings/boards.txt"
	install -m 644 "${srcdir}/config.cfg" "${pkgdir}/usr/lib/brewpi/settings/config.cfg"
	install -m 755 "${srcdir}/brewpi" "${pkgdir}/usr/bin/brewpi"
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p0 -s -i "${srcdir}/fix_dep_syntax.patch"
	cp -R data logs settings tests *.py LogMessages.h "${pkgdir}/usr/lib/brewpi/"
	chown -R 400:400 "${pkgdir}/usr/lib/brewpi"
	find "${pkgdir}/usr/lib/brewpi" -type d -exec chmod g+rwxs {} \;
}
