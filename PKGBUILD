# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: j605

pkgname=python-pyperf
pkgver=2.3.0
pkgrel=1
pkgdesc='Toolkit to run Python benchmarks'
url='https://github.com/vstinner/pyperf'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-psutil')
changelog=changelog.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('b86fca9733edd35709cf09fbdf4e3f093b35121e9ba9bb2a319ecf2780a04dd0'
            '925fb3cc19ca60295ebfdccdb55d805a3f372f9597ef151f77609b520171c23e')

prepare() {
	## remove tests from package
	patch -p1 -d "pyperf-$pkgver" < 001-setup.py.patch
}

build() {
	cd "pyperf-$pkgver"
	python setup.py build
	cd doc
	make man
}

check() {
	cd "pyperf-$pkgver"
	PYTHONPATH=./ python -m unittest discover pyperf/tests
}

package() {
	cd "pyperf-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
	install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 doc/build/man/pyperf.1 -t "$pkgdir/usr/share/man/man1/"
}
