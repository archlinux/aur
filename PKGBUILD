# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pycddlib
_pkg="${pkgname#python-}"
pkgver=2.1.6
pkgrel=1
pkgdesc='Python wrapper for cddlib'
license=('GPL')
arch=('x86_64')
url='https://github.com/mcmtroffaes/pycddlib'
# Note: cddlib is bundled with pycddlib
depends=('python' 'gmp')
makedepends=('cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('c7c87c0992edb608e999c84b3977bdc36035e651bed4ef089427f3b0e840aa3d')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	local _version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_version" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
