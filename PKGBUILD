# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-quicktions
pkgver=1.13
pkgrel=2
pkgdesc="Fast fractions implementation in Cython"
arch=('x86_64')
url="https://github.com/scoder/quicktions"
license=('Python')
depends=('glibc')
makedepends=(
	'python-setuptools'
	'cython'
	'python-build'
	'python-installer'
	'python-wheel')
# checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4dfbe8dee81099deb28059aeeed72e7b47e22c4204be4ad52aef501b49bd21e7')

build() {
	cd "quicktions-$pkgver"
	# needs to build src/quicktions.c first
	python setup.py build_ext --inplace --with-cython
	python -m build --wheel --no-isolation
}

## tests segfault
# check() {
# 	cd "quicktions-$pkgver"
# 	local _py="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_py" pytest -x
# }

package() {
	export PYTHONHASHSEED=0
	cd "quicktions-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/quicktions-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
