# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-utidylib
pkgver=0.8
pkgrel=1
pkgdesc="Wrapper for HTML Tidy"
arch=('any')
url="https://github.com/nijel/utidylib"
license=('MIT')
depends=('tidy' 'python')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
checkdepends=('python-pytest')
changelog=
# source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/u/uTidylib/uTidylib-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9342ae5c99b17c37d15850c2dbcdb9c1a991a12de7f0ec61f06c246d5688db68')

build() {
	cd "utidylib-$pkgver"
	## error during dependency check: slice indices must be integers
	python -m build --wheel --skip-dependency-check --no-isolation
	make -C docs man
}

check() {
	cd "utidylib-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "utidylib-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/utidylib.1 -t "$pkgdir/usr/share/man/man1/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/uTidylib-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
