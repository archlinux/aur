# Maintainer: is1 <is1@sdf.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pycddlib
pkgver=2.1.7
pkgrel=1
pkgdesc='Python wrapper for cddlib'
license=('GPL')
arch=('x86_64')
url='https://github.com/mcmtroffaes/pycddlib'
# Note: cddlib is bundled with pycddlib
depends=('python' 'gmp')
makedepends=('cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycddlib/pycddlib-$pkgver.tar.gz")
sha256sums=('6d0be26049ee303181a1433fc5d57c78fe231b458bdf86855887ca8de83fb55e')

build() {
	cd pycddlib-"$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd pycddlib-"$pkgver"
	local python_version=$(
	  python -c 'from sys import version_info as v; print(f"{v.major}{v.minor}")')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version"
	pytest -x
}

package() {
	cd pycddlib-"$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
