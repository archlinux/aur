# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='stem'
pkgname="python2-$_projectname"
pkgver='1.8.0'
pkgrel='2'
pkgdesc='Tor control library for Python - python2 version'
arch=('any')
url='https://stem.torproject.org/'
license=('LGPL3')
depends=('python2' 'python2-cryptography' 'python2-pysha3')
optdepends=('tor: tor-server to talk to')
makedepends=('python2-setuptools')
checkdepends=('python2-mock' 'python2-pycodestyle' 'python2-pyflakes' 'python2-tox' 'tor')
provides=("$_projectname")
conflicts=("$_projectname")
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://files.pythonhosted.org/packages/source/${_projectname::1}/${_projectname}/${_projectname}-${pkgver}.tar.gz"
	"$pkgname-$pkgver-$pkgrel.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_projectname::1}/${_projectname}/${_projectname}-${pkgver}.tar.gz.asc"
)
sha256sums=('a0b48ea6224e95f22aa34c0bc3415f0eb4667ddeae3dfb5e32a6920c185568c2'
            'SKIP')
validpgpkeys=('68278CC5DD2D1E85C4E45AD90445B7AB9ABBEEC6') # Damian Johnson (www.atagar.com) <atagar1@gmail.com>

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# Ignore broken & unreliable tests
	sed -i 'test/settings.cfg' \
		-e '/|test.unit.installation.TestInstallation/d' \
		-e '/|test.integ.installation.TestInstallation/d' \
		-e '/|test.integ.control.controller.TestController/d' \
		-e '/|test.integ.descriptor.collector.TestCollector/d'
	rm 'test/'{integ,unit}'/installation.py'
	rm 'test/integ/control/controller.py'
	rm 'test/integ/descriptor/collector.py'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python2 run_tests.py --all --target RUN_ALL,ONLINE
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
