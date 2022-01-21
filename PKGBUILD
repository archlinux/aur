# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
pkgver=2.0.4
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture=0.6.3')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycaption/pycaption-$pkgver.tar.gz")
sha256sums=('4124954f6b9aa09d9d50a5c948b5e183643cdd5b4b966b4ee489f60bdbb00941')

prepare() {
	cd "pycaption-$pkgver"
	sed -i "/packages=/s/()/(exclude=('tests*',))/" setup.py
	sed -i '/recursive-include/d' MANIFEST.in
	## fix for python3.10, thanks to nikonaum
	sed -i 's/collections.Callable/collections.abc.Callable/g' \
		pycaption/scc/specialized_collections.py
}

build() {
	cd "pycaption-$pkgver"
	python setup.py build
}

check() {
	cd "pycaption-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "pycaption-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
