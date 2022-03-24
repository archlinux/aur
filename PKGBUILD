# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Antonio Lucas <antonioluccas@gmail.com>

pkgname=python-tidylib
pkgver=0.3.2
pkgrel=1
pkgdesc="Python bindings for Tidy HTML parser/cleaner."
arch=('any')
url="https://github.com/countergram/pytidylib"
license=('MIT')
depends=('tidyhtml' 'python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-pytidylib')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pytidylib/pytidylib-$pkgver.tar.gz")
sha256sums=('22b1c8d75970d8064ff999c2369e98af1d0685417eda4c829a5c9f56764b0af3')

build() {
	cd "pytidylib-$pkgver"
	## dependency check fails due to slicing errors
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "pytidylib-$pkgver"
	python -m unittest discover
}

package() {
	export PYTHONHASHSEED=0
	cd "pytidylib-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/pytidylib-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
