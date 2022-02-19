# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
pkgver=2.0.5
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture=0.6.3')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycaption/pycaption-$pkgver.tar.gz")
sha256sums=('5ab89f553d4a12d704f4248575dd354166909c69c0510f0349d144d19e6d5b34')

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
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "pycaption-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "pycaption-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
