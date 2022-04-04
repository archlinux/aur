# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
pkgver=2.0.7
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycaption/pycaption-$pkgver.tar.gz")
sha256sums=('43f935e5526df8214dcfd3e3f6be6d3aad941bb314c611f768b7709dfdefa68a')

prepare() {
	cd "pycaption-$pkgver"
	sed -i "/packages=/s/()/(exclude=('tests*',))/" setup.py
	## fix for python3.10, thanks to nikonaum
	sed -i 's/collections.Callable/collections.abc.Callable/g' \
		pycaption/scc/specialized_collections.py
}

build() {
	cd "pycaption-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "pycaption-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "pycaption-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
